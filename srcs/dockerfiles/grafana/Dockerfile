# Pull basic image
FROM    alpine

# Author
LABEL   rbakker grafana dockerfile

# Update software packages
RUN		apk add wget
RUN     apk add libc6-compat
RUN     apk add ca-certificates
RUN     apk add su-exec
RUN     apk add bash

# Install grafana
RUN     wget -c https://dl.grafana.com/oss/release/grafana-7.0.5.linux-amd64.tar.gz
RUN     tar -xzvf grafana-7.0.5.linux-amd64.tar.gz
RUN     rm grafana-7.0.5.linux-amd64.tar.gz
RUN     mv /grafana-7.0.5 /usr/share/
RUN     mv /usr/share/grafana-7.0.5 /usr/share/grafana

# Set env variables
ENV     PATH=/usr/share/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV     GF_PATHS_CONFIG="/etc/grafana/grafana.ini"
ENV     GF_PATHS_DATA="/var/lib/grafana"
ENV     GF_PATHS_HOME="/usr/share/grafana"
ENV     GF_PATHS_LOGS="/var/log/grafana"
ENV     GF_PATHS_PLUGINS="/var/lib/grafana/plugins"
ENV     GF_PATHS_PROVISIONING="/etc/grafana/provisioning"

# Add user
RUN     addgroup -S grafana
RUN     adduser -S grafana -G grafana

# Configure Grafana
RUN     mkdir -p "$GF_PATHS_HOME/.aws" "$GF_PATHS_PROVISIONING/datasources" "$GF_PATHS_PROVISIONING/dashboards" "$GF_PATHS_PROVISIONING/notifiers" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS" "$GF_PATHS_DATA" \
RUN     chown -R grafana:grafana "$GF_PATHS_DATA" "$GF_PATHS_HOME/.aws" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS" "$GF_PATHS_PROVISIONING" \
RUN     chmod -R 777 "$GF_PATHS_DATA" "$GF_PATHS_HOME/.aws" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS" "$GF_PATHS_PROVISIONING"

COPY    srcs/grafana.ini /etc/grafana/grafana.ini

# Open access ports
EXPOSE  3000

# Start Grafana
COPY    srcs/start.sh /run.sh
RUN     chmod +x /run.sh
CMD     ["/run.sh"]
