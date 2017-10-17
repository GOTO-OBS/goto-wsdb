GOTO WSDB
=========

A World Sky Database (WSDB) for the [GOTO](https://goto-observatory.org/) project. 

See [the Wiki](https://github.com/GOTO-OBS/goto-wsdb/wiki) for a list of catalogs available and their schema.


Python usage example
---------------------

````python
from wsdb import WSDB
from astropy.table import Table

local_catalogue = Table.read("some-local-catalogue.csv")

client = WSDB(user="goto", host="goto-observatory.org")

print(client.catalogues)
>>> ('apassdr9_main', 'twomass_psc', 'gaiadr1_tgas_source',
     'gaiadr1_gaia_source', 'sdssdr9_phototag', 'goto_sources')

# Nearest-neighbour match with some local catalogue
targets_nearest_neighbour = client.nearest_neighbour_query(
    "apassdr9_main", local_catalogue["ra"], local_catalogue["dec"])

# Polygon search
targets_in_a_box = client.polygon_query("apassdr9_main",
    (127.3239975, 127.3239975,  134.117885,  134.117885),
    (11.5666857, 23.5, 23.5, 11.5666857))

# Cone search
targets_in_a_cone = wsdb.radial_query("apassdr9_main",
    45.212, -34.113, radius=0.1)
````
