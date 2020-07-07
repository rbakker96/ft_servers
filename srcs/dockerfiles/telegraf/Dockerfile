# Pull basic image
FROM    alpine

# Author
LABEL   rbakker telegraf dockerfile

# Update software packages
RUN		apk update
RUN		apk upgrade --available
RUN		apk add wget
RUN     apk add curl

# Install Nginx web server
RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN     tar -xzvf telegraf-1.13.3-static_linux_amd64.tar.gz
RUN		chmod +x telegraf/*
RUN		cp telegraf/telegraf /usr/bin/
RUN		rm -rf *.tar.gz* telegraf/

# Open access ports
EXPOSE	8125

# Start web-server
COPY    srcs/start.sh /tmp
RUN     chmod +x /tmp/start.sh
CMD     sh /tmp/start.sh
