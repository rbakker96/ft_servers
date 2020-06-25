# Pull basic image
FROM    alpine

# Author
LABEL   rbakker nginx dockerfile

# Update software packages
RUN		apk update
RUN		apk upgrade --available
RUN		apk add wget

# install PhP
RUN		apk add php7.3 php-mysql php-fpm php-cli php-mbstring

# install phpMyAdmin
RUN		mkdir -p /phpmyadmin
RUN 	wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		tar -xzvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		mv -v phpMyAdmin-4.9.0.1-all-languages/* /phpmyadmin
RUN		rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		rm -rf phpMyAdmin-4.9.0.1-all-languages
RUN		chmod -R 755 /phpmyadmin

# php config
RUN		mkdir -p /phpmyadmin/tmp
RUN		chmod 777 /phpmyadmin/tmp
COPY 	srcs/config.inc.php /phpmyadmin
COPY	srcs/php.ini /etc/php/7.3/fpm/php.ini
