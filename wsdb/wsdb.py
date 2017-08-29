# -*- coding: utf-8 -*-

import numpy as np
from astropy.table import Table

from .base import BaseWSDB

__all__ = ["WSDB"]

class WSDB(BaseWSDB):

    """ A client to access the World Sky Database. """

    def radial_query(self, catalogue_name, ra, dec, radius=1/3600.0, **kwargs):
        r"""
        Query a catalogue in the World Sky Database for all objects within the 
        radius of a specific location. This is equivalent to performing a cone
        search.

        :param catalogue_name:
            The source catalogue to query. Available catalogues are accessible
            through the ``WSDB.catalogues`` attribute.

        :param ra:
            The right ascension of the location in degrees.

        :param dec:
            The declination of the location in degrees.

        :param radius: [optional]
            The radius of the search cone in degrees.
        """

        self._check_catalogue(catalogue_name)

        # TODO: check if ra/dec are an array
        if np.array(ra).size != np.array(dec).size \
        or np.array(ra).size != 1:
            raise ValueError("ra and dec must be single float-like values")

        query = """
            SELECT *
            FROM {catalogue_name}
            WHERE q3c_radial_query(ra, dec, {ra}, {dec}, {radius})
            """.format(
                catalogue_name=catalogue_name, ra=ra, dec=dec, radius=radius)

        return self.select(query, **kwargs)


    def polygon_query(self, catalogue_name, ras, decs, **kwargs):
        r"""
        Query a catalogue in the World Sky Database for all objects within the
        region bounded by the polygon on the sphere. 

        :param catalogue_name:
            The source catalogue to query. Available catalogues are accessible
            through the ``WSDB.catalogues`` attribute.

        :param ras:
            An array-like object of right ascensions for each polygon point in
            degrees.

        :param decs:
            An array-like object of declinations for each polygon point in
            degrees.        
        """

        self._check_catalogue(catalogue_name)

        ras = np.atleast_1d(ras).flatten()
        decs = np.atleast_1d(decs).flatten()

        if ras.size != decs.size or ras.size < 3:
            raise ValueError("ras and decs should be the same length "\
                             "and greater than 3 ({} < 3)".format(ras.size))
        
        ps = np.vstack([ras, decs]).T.flatten()
        query = """
            SELECT *
            FROM {0}
            WHERE q3c_poly_query(ra, dec, '{{{1}}}');
        """.format(catalogue_name, ", ".join(ps.astype(str)))

        return self.select(query, **kwargs)


    def ellipse_query(self, catalogue_name, ra, dec, major_axis, axis_ratio, 
        positional_angle, **kwargs):
        r"""
        Query a catalogue in the World Sky Database for all objects within the
        region bounded by an ellipse on the sphere.
        
        :param catalogue_name:
            The source catalogue to query. Available catalogues are accessible
            through the ``WSDB.catalogues`` attribute.

        :param ra:
            The right ascension of the ellipse centre in degrees.

        :param dec:
            The declination of the ellipse centre in degrees.

        :param major_axis:
            The major axis of the ellipse.

        :param axis_ratio:
            The axis ratio of the ellipse.

        :param positional_angle:
            The positional angle of the ellipse.
        """

        self._check_catalogue(catalogue_name)

        # TODO: check values of ra, dec, major_axis, axis_ratio, positional_angle

        query = """
            SELECT *
            FROM %s
            WHERE q3c_ellipse_query(ra, dec, %s, %s, %s, %s, %s);
        """
        values = (
            catalogue_name, ra, dec, 
            major_axis, axis_ratio, positional_angle
        )

        return self.select(query, values, **kwargs)



    def nearest_neighbour_query(self, catalogue_name, ras, decs, radius=1.0/3600,
        only_neighbours=False, **kwargs):
        r"""
        Select the nearest neighbour from a catalogue in the World Sky Database
        for each position provided.

        :param catalogue_name:
            The source catalogue to query. Available catalogues are accessible
            through the ``WSDB.catalogues`` attribute.

        :param ras:
            An array-like object of right ascensions. These will be available in
            the returned table as 'input_ra'.

        :param decs:
            An array-like object of declinations. These will be available in the
            returned table as 'input_dec'.

        :param only_neighbours: [optional]
            Only return rows with neighbours (default: False).
        """

        self._check_catalogue(catalogue_name)

        # Create a temporary table on the WSDB.
        positions = Table(
            data=(np.arange(len(ras)), ras, decs),
            names=("input_index", "input_ra", "input_dec"))

        query = """
            SELECT t.*, ss.*
            FROM tmp_nn AS t {on_prefix}
            LATERAL (
                SELECT s.*
                FROM {catalogue_name} AS s
                WHERE q3c_join(t.input_ra, t.input_dec, s.ra, s.dec, {radius})
                ORDER BY q3c_dist(t.input_ra, t.input_dec, s.ra, s.dec)
                ASC LIMIT 1
                )
            AS ss {on_suffix};
            """

        kwds = dict(catalogue_name=catalogue_name, radius=radius)
        if only_neighbours:
            kwds.update(on_prefix=", ", on_suffix="")
        else:
            kwds.update(on_prefix="LEFT JOIN", on_suffix="ON true")

        query = query.format(**kwds)

        return self._local_join(query, "tmp_nn", positions, **kwargs)
