# Colors
Color_Off='\033[0m'       # Text Reset
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

echo -e "${Yellow}---------------------------- Secret ------------------------------${Color_Off}"
kubectl delete secrets/system-secret
echo -e "\n"

echo -e "${Yellow}---------------------------- Nginx ------------------------------${Color_Off}"
kubectl delete services nginx
kubectl delete deployment nginx
echo -e "\n"

echo -e "${Yellow}--------------------------- Mysql -------------------------------${Color_Off}"
kubectl delete deployment/mysql
kubectl delete services/mysql

kubectl delete pvc/mysql-pvc
echo -e "\n"

echo -e "${Yellow}-------------------------- Wordpress ---------------------------${Color_Off}"
kubectl delete deployment/wordpress
kubectl delete services wordpress
echo -e "\n"

echo -e "${Yellow}------------------------- Phpmyadmin ----------------------------${Color_Off}"
kubectl delete deployment/phpmyadmin
kubectl delete service/phpmyadmin
echo -e "\n"

echo -e "${Yellow}-------------------------- Grafana ------------------------------${Color_Off}"
kubectl delete deployment/grafana
kubectl delete service/grafana
kubectl delete configMaps/grafana-config
echo -e "\n"

echo -e "${Yellow}-------------------------- InfluxDB -----------------------------${Color_Off}"
kubectl delete deployment/influxdb
kubectl delete service/influxdb

kubectl delete pvc/influxdb-pvc
echo -e "\n"

echo -e "${Yellow}-------------------------- Telegraf -----------------------------${Color_Off}"
kubectl delete deployment/telegraf
kubectl delete service/telegraf
kubectl delete configmap/telegraf-config
echo -e "\n"

echo -e "${Yellow}-------------------------- Telegraf -----------------------------${Color_Off}"
kubectl delete deployment/ftps
kubectl delete service/ftps
echo -e "\n"

echo -e "${Green}Cluster cleaned${Color_Off}"
