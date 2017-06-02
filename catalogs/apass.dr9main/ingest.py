""" Ingest data from APASS DR9 main. """

import os
from astropy.io import fits
from glob import glob

from wsdb import WSDB


# Connect to the WSDB
wsdb = WSDB(database="wsdb", user="postgres", host="/var/run/postgresql/")


# Create the table.
cwd = os.path.dirname(__file__)
with open(os.path.join(cwd, "schema.sql"), "r") as fp:
    wsdb.execute(fp.read())

# Ingest the data.
filenames = glob(os.path.join(cwd, "*.fits"))
N = len(filenames)

# Details about the data.
table_name = "apassdr9_main"
hdu = 1
bulk_insert = 100000 # number of rows to insert at a time.
schema_mapping = [
    #(postgres_name, fits_name)
    ("objid", "ID"),
    ("ra", "ra_apass"),
    ("raerr", "raerr_apass"),
    ("dec", "dec_apass"),
    ("decerr", "decerr_apass"),
    ("nobs", "nobs"),
    ("mobs", "mobs"),
    ("vjmag", "v"),
    ("bjmag", "b"),
    ("gmag", "g"),
    ("rmag", "r"),
    ("imag", "i"),
    ("evjmag", "verr"),
    ("ebjmag", "berr"),
    ("egmag", "gerr"),
    ("ermag", "rerr"),
    ("eimag", "ierr"),
    ("name", "name")
]

for i, filename in enumerate(filenames):
    print("{}/{}: {}".format(i + 1, N, filename))

    image = fits.open(filename)

    raise a

    rows = []
    J = len(image[hdu].data)
    for j, data_row in enumerate(image[hdu].data):
        print("At row {}/{}".format(j + 1, J))

        row = []
        for to_key, from_key in schema_mapping:
            row.append("{}".format(data_row[from_key]))

        rows.append(",".join(row))

        if len(rows) >= bulk_insert:
            print("Doing bulk insert ({} rows)".format(bulk_insert))

            temp_path = os.path.join(cwd, "tmp_insert.csv")
            with open(temp_path, "w") as fp:
                fp.write("\n".join(rows))

            wsdb.execute("COPY {} FROM '{}'".format(table_name, temp_path))
            os.unlink(temp_path)

            rows[:] = []

    raise a