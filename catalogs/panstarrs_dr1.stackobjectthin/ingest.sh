psql -U postgres -d wsdb -a -f panstarrs_dr1_stackobjectthin
python retrieve.py
psql -U postgres -d wsdb -h localhost -f retrieve.sql
psql -U postgres -a -c "GRANT SELECT ON TABLE panstarrs_dr1_stackobjectthin TO goto;"
psql -U postgres -d wsdb -h localhost -a -c "CREATE INDEX ON panstarrs_dr1_stackobjectthin (q3c_ang2ipix(ra, dec));"
psql -U postgres -d wsdb -h localhost -a -c "CLUSTER panstarrs_dr1_stackobjectthin_q3c_ang2ipix_idx ON panstarrs_dr1_stackobjectthin;"
psql -U postgres -d wsdb -h localhost -a -c "ANALYZE panstarrs_dr1_stackobjectthin;"
