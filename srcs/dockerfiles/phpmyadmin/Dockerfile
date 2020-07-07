# Pull basic image
FROM    alpine

# Author
LABEL   rbakker phpmyadmin dockerfile

# Update software packages
RUN		apk update
RUN		apk upgrade --available
RUN		apk add wget

# Install Php
RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip

# install PhpMyAdmin
RUN		mkdir www
RUN 	wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		tar -xzvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		mv -v phpMyAdmin-4.9.0.1-all-languages/* /www
RUN		rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		rm -rf phpMyAdmin-4.9.0.1-all-languages

# Php config
RUN		mkdir -p /www/tmp
RUN		chmod 777 /www/tmp
COPY 	srcs/config.inc.php /www
COPY	srcs/php.ini /etc/php/7.3/fpm/php.ini

# Open access ports
EXPOSE	5000

# Start PhphMyAdmin
COPY    srcs/start.sh /www
RUN     chmod +x /www/start.sh
CMD     sh www/start.sh
