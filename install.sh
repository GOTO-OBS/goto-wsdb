sudo apt-get update
sudo apt-get -y install gcc postgresql postgresql-server-dev-all
git clone https://github.com/segasai/q3c.git
cd q3c/
make
sudo make install
cd ../
# TODO: Need PGVERSION if not on Travis...
sudo chmod 777 /etc/postgresql/$PGVERSION/main/pg_hba.conf
sudo echo "local   all         postgres                          trust" > /etc/postgresql/$PGVERSION/main/pg_hba.conf
sudo echo "local   all         all                               trust" >> /etc/postgresql/$PGVERSION/main/pg_hba.conf
sudo echo "host    all         all         127.0.0.1/32          trust" >> /etc/postgresql/$PGVERSION/main/pg_hba.conf
sudo echo "host    all         all         ::1/128               trust" >> /etc/postgresql/$PGVERSION/main/pg_hba.conf
sudo echo "host    all         all         ::1/128               trust" >> /etc/postgresql/$PGVERSION/main/pg_hba.conf
# TODO: Too open?
sudo echo "host    all         all         0.0.0.0/0             md5" >> /etc/postgresql/$PGVERSION/main/pg_hba.conf
sudo echo "host    all         all         ::/0                  md5" >> /etc/postgresql/$PGVERSION/main/pg_hba.conf
sudo echo "listen_address = '*'" >> /etc/postgresql/$PGVERSION/main/postgresql.conf
sudo service postgresql restart
psql -U postgres -c "CREATE USER goto"
psql -U postgres -c "CREATE DATABASE wsdb"
psql -U postgres -c "ALTER USER goto WITH PASSWORD '$GOTO_PASSWORD'"
psql -U postgres -c "ALTER DATABASE wsdb OWNER TO goto"
psql -U postgres -d wsdb -c "CREATE EXTENSION q3c"
