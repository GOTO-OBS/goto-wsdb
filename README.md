GOTO WSDB
=========

[![Build Status](https://travis-ci.org/andycasey/goto-wsdb.svg?branch=master)](https://travis-ci.org/andycasey/goto-wsdb)

A World Sky Database (WSDB) for the [GOTO](https://goto-observatory.org/) project.


Installation
------------

Use the ``install.sh`` script (in ``sudo`` mode) to install [PostgreSQL](https://www.postgresql.org) and [Q3C](https://github.com/segasai/q3c):

````
sudo sh install.sh
````

Then install the ``wsdb`` module with the following command:

````
python setup.py install
````

Ingest data
-----------

# todo give apass example


Usage examples: Python
----------------------

The following Python code will run a cone search:

````python
from wsdb import WSDB

wsdb = WSDB(user="goto", host="goto-observatory.org")


results = wsdb.cone_search(45.212, -34.113, radius=1/3600.)
````

Maintainer
----------
- [Andy Casey](http://astrowizici.st) (Monash)


Acknowledgements
----------------
- Sergey Koposov (CMU)
