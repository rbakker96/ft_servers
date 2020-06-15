# ------------------------- Nginx -----------------------------
kubectl delete services nginx-server
kubectl delete deployment nginx-deployment

#------------------- Ingress controller -----------------------
kubectl delete ingress/ingress-deployment

# ------------------------- Mysql -----------------------------
kubectl delete secrets mysql-secret
kubectl delete deployment/mysql-deployment
kubectl delete services mysql-service

kubectl delete pvc/mysql-pvc
kubectl delete pv/mysql-pv

# ------------------------ Wordpress --------------------------
kubectl delete deployment/wordpress-deployment
kubectl delete services wordpress-service

# ------------------------ Phpmyadmin --------------------------
kubectl delete deployment  phpmyadmin-deployment
kubectl delete service  phpmyadmin-service
