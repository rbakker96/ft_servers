# Pull basic image
FROM    alpine

# Author
LABEL   rbakker wordpress dockerfile

# Update software packages
RUN	apk update
RUN	apk add wget

# Install Php
RUN     apk add php7-common php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-phar php7-cli php7-zip php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

# Install nginx
RUN     apk add nginx
COPY    srcs/nginx.conf /etc/nginx
RUN     rm -rf /var/cache/apk/*

# Add user and folder
RUN     adduser -D -g 'www' www
RUN     mkdir /www
RUN     chown -R www:www /var/lib/nginx
RUN     chown -R www:www /www

# Configure php
COPY	srcs/php.ini /etc/php/7.3/fpm/php.ini
COPY 	srcs/config.inc.php /www
RUN     sed -i "s|;listen.owner\s*=\s*nobody|listen.owner = www|g" /etc/php7/php-fpm.d/www.conf ;\
        sed -i "s|;listen.group\s*=\s*nobody|listen.group = www|g" /etc/php7/php-fpm.d/www.conf ;\
        sed -i "s|;listen.mode\s*=\s*0660|listen.mode = 0660|g" /etc/php7/php-fpm.d/www.conf ;\
        sed -i "s|user\s*=\s*nobody|user = www|g" /etc/php7/php-fpm.d/www.conf ;\
        sed -i "s|group\s*=\s*nobody|group = www|g" /etc/php7/php-fpm.d/www.conf ;\
        sed -i "s|;log_level\s*=\s*notice|log_level = notice|g" /etc/php7/php-fpm.d/www.conf ;

#install wordpress
RUN     wget -c https://wordpress.org/latest.tar.gz
RUN     tar -xzvf latest.tar.gz -C /www
COPY    srcs/wp-config.php /www/wordpress/wp-config.php
RUN     chown -R www:www /var/lib/nginx
RUN     chown -R www:www /www/*

# Open access ports
EXPOSE  5050

# Start wordpress instalation
COPY    srcs/start.sh /
RUN     chmod +x /start.sh
CMD     sh /start.sh
