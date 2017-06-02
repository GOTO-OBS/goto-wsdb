
import numpy as np
import os
import psycopg2 as pg
import yaml
from astropy.table import Table
from time import time


class WSDB(object):

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

        default_configuration_filename = os.path.expanduser("~/.wsdb.yaml")
        if os.path.exists(default_configuration_filename):
            with open(default_configuration_filename, "r") as fp:
                default_configuration = yaml.load(fp)

            for k, v in default_configuration.items():
                kwargs.setdefault(k, v)

        self._default_return_as_table = True
        self._connection = pg.connect(**kwargs)
        return None


    @property
    def catalogues(self):
        r"""
        Return a list of the astronomical catalogues available.
        """

        _, catalogue_names, __ = self.execute("""
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema = 'public'""", fetch=True)
        return tuple(*catalogue_names)


    def cone_search(self, ra, dec, catalog, radius=1/3600.0, **kwargs):
        r"""
        Query a catalog in the World Sky Database for all objects within radius of
        a specific location.

        :param ra:
            The right ascension of the location in degrees.

        :param dec:
            The declination of the location in degrees.

        :param catalog:
            The source catalog to query.

        :param radius: [optional]
            The radius of the search cone in degrees.
        """

        # TODO: check if ra/dec are an array


        query = """
            SELECT *
            FROM %s
            WHERE q3c_radial_query(ra, dec, %s, %s, %s)
            """
        values = (catalog, ra, dec, radius)

        return self.select(query, values, **kwargs)


    def select(self, query, values=None, **kwargs):
        r"""
        Perform a SQL selec
        select some results.
        """
        
        names, rows, cursor = self.execute(query, values, fetch=True)
        if len(rows) == 0:
            return None

        if kwargs.get("as_table", self._default_return_as_table):
            counted_names = Counter(names)
            duplicates = [k for k, v in counted_names.items() if v > 1]
        
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


    def execute(self, query, values=None, fetch=False, **kwargs):
        r"""
        Execute a SQL query on  the database.

        :param query:
            The SQL query to execute.

        :param values: [optional]
            Values to use when formatting the SQL string.

        """

        t_init = time()
        try:
            with self._connection.cursor() as cursor:
                cursor.execute(query, values)
                results = cursor.fetchall() if fetch else None

        except pg.ProgrammingError:
            logger.exception("SQL query failed: {} {}".format(query, values))
            cursor.close()
            raise

        else:
            t_taken = 1e3 * (time() - t_init)

        names = None if cursor.description is None \
                     else tuple([col[0] for col in cursor.description])

        return (names, results, cursor)




    def polygon_search():
        raise NotImplementedError


    def nearest_neighbour():
        raise NotImplementedError