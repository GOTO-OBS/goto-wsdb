apt-get update
apt-get install postgresql postgresql-contrib
apt-get install postgresql-server-dev-all postgresql-common
# Change the default permissions to 'trust' 
# Re-start the postgres server
git clone https://github.com/segasai/q3c.git
cd q3c/
make
make install
cd ../
sudo -i -u postgres
createuser goto
createdb wsdb
psql -c "ALTER USER goto WITH PASSWORD '$GOTO_PASSWORD'"
psql -c 'ALTER DATABASE wsdb OWNER TO goto'
psql -d wsdb -c 'create extension q3c'
exit
