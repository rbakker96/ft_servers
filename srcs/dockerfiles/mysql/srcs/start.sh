#!/bin/bash

# Execute wordpress script without interupting parent process
nohup sh /wordpress.sh > /dev/null 2>&1 &

/usr/bin/mysql_install_db --user=mysql

/usr/bin/mysqld_safe
