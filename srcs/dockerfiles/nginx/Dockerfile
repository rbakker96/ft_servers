# Pull basic image
FROM    alpine

# Author
LABEL   rbakker nginx dockerfile

# Update software packages
RUN		apk update
RUN		apk upgrade --available
RUN		apk add wget
RUN     apk add openssh

# Install Nginx web server
RUN		apk add nginx

# Replace config file
COPY	srcs/nginx.conf /etc/nginx/nginx.conf

# Copy ssl certificates to web server
COPY	srcs/localhost.cert /ect/ssl/certs/
COPY	srcs/localhost.key /ect/ssl/certs/

# Change ownership files
RUN     adduser -D -g 'www' www
RUN     mkdir /www
RUN     chown -R www:www /var/lib/nginx
RUN     chown -R www:www /www
COPY    srcs/index.html /www

# Open access ports
EXPOSE	80 443

ENTRYPOINT ["/docker-entrypoint.sh"]

# Start web-server
RUN     mkdir -p /run/nginx
CMD     usr/sbin/nginx -g "daemon off;"
