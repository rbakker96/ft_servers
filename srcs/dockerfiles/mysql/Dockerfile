# Pull basic image
FROM        alpine:latest

# Author
LABEL       rbakker mysql dockerfile

# Update software packages
RUN	    	apk update
RUN		    apk upgrade --available

# Install mysql
RUN         apk add --no-cache mysql mysql-client
RUN         rm -f /var/cache/apk/*

# Set right configuration
RUN         addgroup mysql mysql
COPY        srcs/my.cnf /etc/mysql/my.cnf

# Create right environment
ENV         MYSQL_ROOT_PASSWORD=admin
ENV         MYSQL_USER_NAME=admin
ENV         MYSQL_USER_PASSWORD=admin
ENV         MYSQL_DB_NAME=wordpress
VOLUME      [ "/var/lib/mysql" ]

# Wordpress instalation
COPY        srcs/wordpress.sh /
RUN         chmod +x /wordpress.sh
COPY        srcs/wordpress.sql /

# Open access ports
EXPOSE      3306

# Start Mysql
COPY        srcs/start.sh /
RUN         chmod +x /start.sh
CMD         sh /start.sh
