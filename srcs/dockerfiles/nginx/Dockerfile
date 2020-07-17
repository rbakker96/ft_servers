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

# Add homepage files to webserver
COPY    srcs/index.html /www
RUN 	mkdir /www/img
COPY 	srcs/img/* /www/img/
RUN 	mkdir /www/css
COPY  	srcs/style.css /www/css/

# SSH server
RUN     addgroup sshgroup \
	    && adduser -D admin \
	    && echo "admin:admin" | chpasswd \
	    && ssh-keygen -A
COPY    srcs/sshd_config /etc/ssh/sshd_config

# Open access ports
EXPOSE	80 443 4000

# Start web-server
RUN     mkdir -p /run/nginx

COPY    srcs/start.sh /tmp
CMD     sh /tmp/start.sh
