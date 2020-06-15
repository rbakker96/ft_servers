#set environment to minikube
eval $(minikube docker-env)

#build Nginx docker image
cd srcs/nginx
docker build -t nginx_rbakker .
cd -

# ------------------------- Nginx -----------------------------
#deploy nginx webserver with service
kubectl create -f srcs/nginx/nginx_deployment.yml

#------------------- Ingress controller -----------------------
minikube addons enable ingress
kubectl create -f srcs/ingress/ingress-deployment.yml

# ------------------------- Mysql -----------------------------
# Create presisent volume
kubectl create -f srcs/mysql/mysql-pvc.yml

# Create deployment
kubectl create -f srcs/mysql/mysql-deployment.yml

# ------------------------ Phpmyadmin --------------------------
# Create deployment
kubectl create -f srcs/phpmyadmin/phpmyadmin-deployment.yml

# ------------------------ Wordpress --------------------------
# Create deployment
kubectl create -f srcs/wordpress/wordpress-deployment.yml

