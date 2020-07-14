# Pull basic image
FROM    alpine

# Author
LABEL   rbakker ftps dockerfile

# Update software packages
RUN	    apk update
RUN		apk upgrade --available

# Install ftp
RUN     apk add vsftpd
RUN     rm -f /var/cache/apk/*

# Set right configuration
COPY    srcs/vsftpd.config /etc/vsftpd/vsftpd.conf
COPY    srcs/ftps.key /etc/ssl/private/vsftpd.key
COPY    srcs/ftps.crt /etc/ssl/certs/vsftpd.crt
RUN     chmod 600 /etc/ssl/*

# Add env variables
ENV     FTP_USER=admin
ENV     FTP_PASS=admin
ENV     PASV_ADDRESS="192.168.99.204"
ENV     PASV_MIN_PORT="22000"
ENV     PASV_MAX_PORT="22005"

# Open access ports
EXPOSE  20 21 22000-22005

# Start ftps
COPY    srcs/start.sh /
RUN     chmod +x /start.sh
CMD     sh /start.sh
