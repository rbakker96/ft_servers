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
#minikube start --vm-driver virtualbox --memory 3000 --extra-config=apiserver.service-node-port-range=80-65000
#minikube start --driver=virtualbox --extra-config=apiserver.service-node-port-range=1-65535 --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true

# Set environment to minikube
eval $(minikube docker-env)

echo -e "${Purple}---------------------------- Secret ------------------------------${Color_Off}"
kubectl create -f srcs/yaml_files/system_secret.yml
echo -e "\n"

echo -e "${Purple}-------------------------- Metalllb ------------------------------${Color_Off}"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl create -f srcs/yaml_files/metallb.yml
echo -e "\n"

echo -e "${Purple}----------------------------- Nginx ------------------------------${Color_Off}"
cd srcs/dockerfiles/nginx
docker build -t nginx_rbakker .
cd -
kubectl create -f srcs/yaml_files/nginx.yml
echo -e "\n"

echo -e "${Purple}--------------------------- Mysql --------------------------------${Color_Off}"
kubectl create -f srcs/yaml_files/mysql.yml
echo -e "\n"

echo -e "${Purple}------------------------- Phpmyadmin -----------------------------${Color_Off}"
cd srcs/dockerfiles/phpmyadmin
docker build -t phpmyadmin_rbakker .
cd -
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
kubectl create configmap grafana-config \
  --from-file=srcs/yaml_files/influxdb-datasource.yml \
  --from-file=srcs/yaml_files/grafana-dashboard-provider.yml \
  --from-file=srcs/json_files/grafana-dashboard.json \
  --from-file=srcs/json_files/influxdb-dashboard.json \
  --from-file=srcs/json_files/mysql-dashboard.json \
  --from-file=srcs/json_files/nginx-dashboard.json \
  --from-file=srcs/json_files/phpmyadmin-dashboard.json \
  --from-file=srcs/json_files/telegraf-dashboard.json \
  --from-file=srcs/json_files/wordpress-dashboard.json

kubectl create -f srcs/yaml_files/grafana.yml
echo -e "\n"

echo -e "${Purple}--------------------------- FTPS ---------------------------------${Color_Off}"
kubectl create -f srcs/yaml_files/ftps.yml
echo -e "\n"

echo -e "${Green}---------------------- Cluster overview ---------------------------${Color_Off}"
sleep 30
kubectl get all
echo -e "\n"
echo -e "${Green}Go to $(minikube ip)${Color_Off}"
echo -e "\n"
