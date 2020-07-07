# Pull basic image
FROM    alpine

# Author
LABEL   rbakker influxdb dockerfile

# Update software packages
RUN		apk update
RUN		apk upgrade --available

# install influxDB
RUN     apk add influxdb

# Select volume
VOLUME [ "/var/lib/influxdb" ]

# Open access ports
EXPOSE	5000

# Start influxdb
COPY    srcs/start.sh /tmp
RUN     chmod +x /tmp/start.sh
CMD     sh tmp/start.sh
