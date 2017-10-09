psql -U postgres -d wsdb -a -f sdssdr9_phototag_schema
#psql -U postgres -a -c "GRANT SELECT ON TABLE sdssdr9_phototag TO goto;"
#psql -U postgres -d wsdb -h localhost -a -c "CREATE INDEX ON sdssdr9_phototag (q3c_ang2ipix(ra, dec));"
#psql -U postgres -d wsdb -h localhost -a -c "CLUSTER sdssdr9_phototag_q3c_ang2ipix_idx ON sdssdr9_phototag;"
#psql -U postgres -d wsdb -h localhost -a -c "ANALYZE sdssdr9_phototag;"
