# Pull basic image
FROM    alpine

# Author
LABEL   rbakker phpmyadmin dockerfile

# Update software packages
RUN	apk update
RUN	apk upgrade --available
RUN	apk add wget

# Install nginx
RUN     apk add nginx
COPY    srcs/nginx.conf /etc/nginx

# Install Php
RUN	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip

# Install PhpMyAdmin
RUN	mkdir www
RUN 	wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN	tar -xzvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN	mv -v phpMyAdmin-4.9.0.1-all-languages/* /www
RUN	rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN	rm -rf phpMyAdmin-4.9.0.1-all-languages

# Php config
RUN	mkdir -p /www/tmp
RUN	chmod 777 /www/tmp
COPY 	srcs/config.inc.php /www
COPY	srcs/php.ini /etc/php7/php.ini
RUN     sed -i "s|;listen.owner\s*=\s*nobody|listen.owner = www|g" /etc/php7/php-fpm.d/www.conf ;\
        sed -i "s|;listen.group\s*=\s*nobody|listen.group = www|g" /etc/php7/php-fpm.d/www.conf ;\
        sed -i "s|;listen.mode\s*=\s*0660|listen.mode = 0660|g" /etc/php7/php-fpm.d/www.conf ;\
        sed -i "s|user\s*=\s*nobody|user = www|g" /etc/php7/php-fpm.d/www.conf ;\
        sed -i "s|group\s*=\s*nobody|group = www|g" /etc/php7/php-fpm.d/www.conf ;\
        sed -i "s|;log_level\s*=\s*notice|log_level = notice|g" /etc/php7/php-fpm.d/www.conf ;

# Add user and folder
RUN     adduser -D -g 'www' www
RUN     chown -R www:www /var/lib/nginx
RUN     chown -R www:www /www

# Open access ports
EXPOSE	5000

# Start PhphMyAdmin
COPY    srcs/start.sh /www
RUN     chmod +x /www/start.sh
CMD     sh www/start.sh
