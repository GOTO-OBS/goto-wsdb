
import logging
import numpy as np
import os
import psycopg2 as pg
import yaml
from astropy.table import Table
from time import time
from collections import Counter
from tempfile import mkstemp

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)
ch.setFormatter(
    logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s"))

logger.addHandler(ch)


__all__ = ["BaseWSDB"]

class BaseWSDB(object):

    """ A base client to access the World Sky Database. """

    def __init__(self, **kwargs):
        r"""
        Create a new database connection to the World Sky database.

        The connection parameters can be specified as a string:

            wsdb = WSDB("user=goto password=secret")

        or using a set of keyword arguments:

            wsdb = WSDB(user="goto", password="secret")

        Or as a mix of both. The basic connection parameters are:

        - *dbname*: the database name
        - *database*: the database name (only as keyword argument)
        - *user*: the user name used to authenticate
        - *password*: password used to authenticate
        - *host*: database host address (defaults to UNIX socket if not given)
        - *port*: connection port number (defaults to 5432 if not given)
        """

        default_configuration_filename = os.path.expanduser("~/.goto-wsdb.yaml")
        if os.path.exists(default_configuration_filename):
            with open(default_configuration_filename, "r") as fp:
                default_configuration = yaml.load(fp)

            for k, v in default_configuration.items():
                kwargs.setdefault(k, v)

        self._default_return_as_table = True
        self._connection = pg.connect(**kwargs)
        return None


    def close(self):
        r"""
        Close the connection to the WSDB.
        """
        return self._connection.close()


    @property
    def catalogues(self):
        r"""
        Return a cached tuple of the astronomical catalogues available.
        """

        if not hasattr(self, "_catalogues"):
            _, results, __ = self.execute("""
                SELECT table_name
                FROM information_schema.tables
                WHERE table_schema = 'public'""", fetch=True)
            self._catalogues = tuple([i for sl in results for i in sl])
        return self._catalogues


    def _check_catalogue(self, catalogue):
        r"""
        Check whether a catalogue is available in the WSDB.
    
        :param catalogue_name:
            The source catalogue to query. Available catalogues are accessible
            through the ``WSDB.catalogues`` attribute.

        :returns:
            ``True`` if the catalogue is available.

        :raises ValueError:
            If the catalogue is not available.
        """

        if catalogue not in self.catalogues:
            raise ValueError("catalogue '{}' unavailable (available: {})".format(
                catalogue, ", ".join(self.catalogues)))
        return True


    def select(self, query, values=None, **kwargs):
        r"""
        A convenience function to perform SQL select queries on the WSDB.

        Perform a SQL select query 
        select some results.
        """
        
        names, rows, cursor = self.execute(query, values, fetch=True, **kwargs)
        if len(rows) == 0:
            return None

        if kwargs.get("as_table", self._default_return_as_table):
            counted_names = Counter(names)
            duplicates = [k for k, v in counted_names.items() if v > 1]
        
            prefixes = kwargs.get("prefixes", True)
            use_prefixes = map(str, range(max(counted_names.values()))) \
                if isinstance(prefixes, bool) else prefixes

            # Put the prefixes and names in the right order & format 
            prefixes = [
                ([], [use_prefixes[names[:i].count(n)]])[n in duplicates] \
                for i, n in enumerate(names)]
            names = [[n] for n in names]
            names = [".".join(p + n) for p, n in zip(prefixes, names)]
            return Table(rows=rows, names=names)

        else:
            return rows


    def execute(self, query, values=None, fetch=False, cursor=None, **kwargs):
        r"""
        Execute a SQL query on the WSDB.

        :param query:
            The SQL query to execute.

        :param values: [optional]
            Values to use when formatting the SQL string.

        :param fetch: [optional]
            Fetch all row results for this query (default: `False`).

        :returns:
            A three-length tuple containing the column names (where applicable),
            the results (if `fetch` is `True`, otherwise `None`), and the
            cursor.

        """

        cursor_supplied = cursor is not None

        if not cursor_supplied:
            logger.debug("Creating cursor")
            cursor = self._connection.cursor()

        t_init = time()
        try:
            logger.debug("Executing query: {} with values: {}".format(
                query, values))
            cursor.execute(query, values)
            results = cursor.fetchall() if fetch else None

        except pg.ProgrammingError:
            logger.exception("SQL query failed: {} {}".format(query, values))
            if not cursor_supplied:
                cursor.close()
            raise

        else:
            t_taken = 1e3 * (time() - t_init)
            logger.debug("SQL query took {0:.0f} ms: {1} (values: {2})".format(
                t_taken, query, values))

        names = None if cursor.description is None \
                     else tuple([col[0] for col in cursor.description])

        if not cursor_supplied: 
            cursor.close()

        return (names, results, cursor)



        

    def _local_join(self, query, table_name, table, values=None, analyze=True,
        **kwargs):
        r"""
        Perform a join between a local table and a remote catalogue on the
        World Sky Database.

        """

        delimiter = kwargs.get("delimiter", ",")
        conversions = {
            np.int32: "integer",
            np.int64: "bigint",
            np.float32: "real",
            np.float64: "double precision",
            np.string_: "varchar"
        }

        schema = []
        for column, (dtype, _) in table.dtype.fields.items():
            if " " in column:
                raise ValueError("invalid column name: cannot contain spaces")
            schema.append("{0} {1}".format(column, conversions[dtype.type]))

        _, local_path = mkstemp()

        table.write(local_path, format="ascii.no_header", delimiter=delimiter, 
            overwrite=True)

        with self._connection.cursor() as cursor:

            self.execute("""
                SET cursor_tuple_fraction TO 1;
                SET enable_seqscan TO off;
                SET enable_mergejoin to off;
                set enable_hashjoin to off;
            """)

            self.execute("CREATE TEMPORARY TABLE {0} ({1})".format(
                table_name, ", ".join(schema)), cursor=cursor)

            try:
                logger.debug("Copying from {}".format(local_path))

                with open(local_path, "r") as fp:
                    cursor.copy_from(fp, table_name,
                        sep=delimiter, columns=table.dtype.names)

                if analyze:
                    self.execute("ANALYZE {0}".format(table_name), cursor=cursor)

                logger.debug("Ready")

            except (pg.ProgrammingError, pg.DataError):
                logger.exception("Failed to upload table:")
                self._connection.rollback()

            result = self.select(query, values, cursor=cursor)

        self._connection.rollback()
        #cursor.close()

        os.unlink(local_path)
        return result
