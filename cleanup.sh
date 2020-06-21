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
kubectl delete services nginx-server
kubectl delete deployment nginx-deployment
echo -e "\n"

echo -e "${Yellow}-------------------- Ingress controller -------------------------${Color_Off}"
kubectl delete ingress/ingress-deployment
echo -e "\n"

echo -e "${Yellow}--------------------------- Mysql -------------------------------${Color_Off}"
kubectl delete deployment/mysql-deployment
kubectl delete services/mysql-service

kubectl delete pvc/mysql-pvc
kubectl delete pv/mysql-pv
echo -e "\n"

echo -e "${Yellow}-------------------------- Wordpress ---------------------------${Color_Off}"
kubectl delete deployment/wordpress-deployment
kubectl delete services wordpress-service
echo -e "\n"

echo -e "${Yellow}------------------------- Phpmyadmin ----------------------------${Color_Off}"
kubectl delete deployment/phpmyadmin-deployment
kubectl delete service/phpmyadmin-service
echo -e "\n"

echo -e "${Yellow}-------------------------- Grafana ------------------------------${Color_Off}"
kubectl delete deployment/grafana-deployment
kubectl delete service/grafana-service
echo -e "\n"

echo -e "${Yellow}-------------------------- InfluxDB -----------------------------${Color_Off}"
kubectl delete deployment/influxdb-deployment
kubectl delete service/influxdb-service

kubectl delete pvc/influxdb-pvc
kubectl delete pv/influxdb-pv
echo -e "\n"

echo -e "${Yellow}-------------------------- Telegraf -----------------------------${Color_Off}"
kubectl delete deployment/telegraf-deployment
kubectl delete service/telegraf-service
echo -e "\n"

echo -e "${Green}Cluster cleaned${Color_Off}"
