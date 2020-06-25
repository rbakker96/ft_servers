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

# Start cluster
#minikube start --vm-driver virtualbox --extra-config=apiserver.service-node-port-range=80-65000
#minikube start --driver=virtualbox --extra-config=apiserver.service-node-port-range=1-65535 --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true

# Set environment to minikube
eval $(minikube docker-env)

echo -e "${Purple}---------------------------- Secret ------------------------------${Color_Off}"
kubectl create -f srcs/yaml_files/system_secret.yml
echo -e "\n"

echo -e "${Purple}----------------------------- Nginx ------------------------------${Color_Off}"
cd srcs/dockerfiles/nginx
docker build -t nginx_rbakker .
cd -
kubectl create -f srcs/yaml_files/nginx.yml
echo -e "\n"

echo -e "${Purple}---------------------- Ingress controller ------------------------${Color_Off}"
minikube addons enable ingress
sleep 45
kubectl create -f srcs/yaml_files/ingress-deployment.yml
echo -e "\n"

echo -e "${Purple}--------------------------- Mysql --------------------------------${Color_Off}"
kubectl create -f srcs/yaml_files/mysql.yml
echo -e "\n"

echo -e "${Purple}------------------------- Phpmyadmin -----------------------------${Color_Off}"
kubectl create -f srcs/yaml_files/phpmyadmin.yml
echo -e "\n"

echo -e "${Purple}-------------------------- Wordpress -----------------------------${Color_Off}"
kubectl create -f srcs/yaml_files/wordpress.yml
echo -e "\n"

echo -e "${Purple}-------------------------- InfluxDB ------------------------------${Color_Off}"
kubectl create -f srcs/yaml_files/influxdb.yml
echo -e "\n"

echo -e "${Purple}-------------------------- Telegraf ------------------------------${Color_Off}"
minikube addons enable metrics-server
sleep 45
kubectl create -f srcs/yaml_files/telegraf.yml
echo -e "\n"

echo -e "${Purple}-------------------------- Grafana -------------------------------${Color_Off}"
kubectl create -f srcs/yaml_files/grafana.yml
echo -e "\n"

echo -e "${Green}---------------------- Cluster overview ---------------------------${Color_Off}"
sleep 30
kubectl get all
echo -e "\n"
echo -e "${Green}Go to $(minikube ip)${Color_Off}"
