psql -U postgres -d wsdb -a -f apassdr9_main_schema
python ingest.py
psql -U postgres -d wsdb -h localhost -a -c "CREATE INDEX ON apassdr9_main (q3c_ang2ipix(ra, dec));"
psql -U postgres -d wsdb -h localhost -a -c "CLUSTER apassdr9_main_q3c_ang2ipix_idx ON apassdr9_main;"
psql -U postgres -d wsdb -h localhost -a -c "ANALYZE apassdr9_main;"
