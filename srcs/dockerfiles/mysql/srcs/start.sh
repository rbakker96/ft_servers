#!/bin/bash

# Execute wordpress script without interupting parent process
nohup sh /wordpress.sh > /dev/null 2>&1 &

# Define directory for database
/usr/bin/mysql_install_db --user=mysql

# Start MySQL
/usr/bin/mysqld_safe
