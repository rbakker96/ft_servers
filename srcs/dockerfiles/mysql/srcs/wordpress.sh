#!/bin/bash

#Starting sql
printf 'Waiting for mysql'
until mysql
do
	echo "."
	sleep 1
done
printf '\n'

# Sending commands into commands.sql
cat << EOF > commands.sql
USE mysql;
CREATE USER 'admin'@'%';
GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' WITH GRANT OPTION;
SET PASSWORD FOR 'admin'@'%' = PASSWORD('admin');
FLUSH PRIVILEGES;
EOF

# Sending commands into mysql
mysql -u root -e 'CREATE DATABASE wordpress;'
mysql -u root wordpress < /wordpress.sql
mysql -u root < commands.sql

rm -f commands.sql
