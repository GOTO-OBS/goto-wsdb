psql -U postgres -d wsdb -a -f apassdr9_main_schema
python ingest.py
