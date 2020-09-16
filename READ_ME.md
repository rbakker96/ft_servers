<p align="center">
  <img src="https://github.com/rbakker96/images/blob/master/codam_logo.png">
</p>

# Ft_services 
***This is a System Administration and Networking project.***

---

### Project summary
> 3th ring Codam project

Ft_services will introduce you to kubernetes. You will discover cluster management and deployment with Kubernetes. You will virtualize a network and do "clustering".

---

### Technical considerations
> The project needs to comply with the following rules/functionalities.

The project consists of setting up an infrastructure of different services. To do this, you must use Kubernetes. You will need to set up a multi-service cluster. Each service will have to run in a dedicated container. Each container must bear the same name as the service concerned and For performance reasons, containers have to be build using Alpine Linux. Also, they will need to have a Dockerfile written by you which is called in the setup.sh. You will have to build yourself the images that you will use. It is forbidden to take already build images or use services like DockerHub.
You will also have to set up:
- The Kubernetes web dashboard. This will help you manage your cluster.
- The Load Balancer which manages the external access of your services. It will be the only entry point to your cluster. You must keep the ports associated with the service (IP:3000 for grafana etc).
- A Nginx server listening on ports 80 and 443. Port 80 will be in http and should be a systematic redirection of type 301 to 443, which will be in https. The page displayed does not matter.
- A FTPS server listening on port 21.
- A WordPress website listening on port 5050, which will work with a MySQL database. Both services have to run in separate containers. The WordPress website will have several users and an administrator.
- PhpMyAdmin, listening on port 5000 and linked with the MySQL database.
- A Grafana platform, listening on port 3000, linked with an InfluxDB database. Grafana will be monitoring all your containers. You must create one dashboard per service. InfluxDB and grafana will be in two distincts containers.
- In case of a crash or stop of one of the two database containers, you will have to make shure the data persist.
- You must be able to access the Nginx container by logging into SSH.
- All your containers must restart in case of a crash or stop of one of its component parts.

Make sure that each redirection toward a service is done using a load balancer. tps, grafana, nginx, phpmyadmin and wordpress’s kind must be "LoadBalancer". influxdb and mysql’s kind must be "ClusterIP". Other entries can be present, be none can be of kind "NodePort". Each EXTERNAL-IP must be unique.

---

### Usage

> CODAM - Create space to install minikube 

```shell
$ echo -n \"Available before:\t\"; df -h | grep $HOME | sed 's/  */:/g' | cut -d ':' -f 4; unsetopt nomatch; rm -Rf ~/Library/*.42_cache_bak*; rm -Rf ~/*.42_cache_bak_*; setopt nomatch; echo -n \"Available after:\t\"; df -h | grep $HOME | sed 's/  */:/g' | cut -d ':' -f 4;
```

> CODAM - Start docker in goinfre

```shell
$ rm -rf ~/Library/Containers/com.docker.docker
$ mkdir -p ~/goinfre/docker
$ ln -s ~/goinfre/docker ~/Library/Containers/com.docker.docker
```

> CODAM - Install minikube

```shell
$ brew install minikube
$ mkdir -p ~/goinfre/minikube
$ chmod +x ~/goinfre/minikube
$ export MINIKUBE_HOME=/Volumes/Storage/goinfre/rbakker/minikube/ (replace rbakker with your intra name)
```

> Install virtualbox

```shell
Install at https://www.virtualbox.org/wiki/Downloads
```

> Install ftp client (Filezilla)

```shell
Install at https://dl1.cdn.filezilla-project.org/client/FileZilla_3.48.1_macosx-x86.app.tar.bz2?h=kZVZGu7vGVngVkZyQWdQ_A&x=1593598398
```

> Run the following commands in the terminal

```shell
$ git clone https://github.com/rbakker96/ft_services.git ft_services
$ cd ft_services
-> start docker desktop
$ bash setup.sh
$ go to 192.168.99.200
```

---

### Used resources
> Most noteworthy resources used during this project

- <a href="https://www.geeksforgeeks.org/input-output-system-calls-c-create-open-close-read-write/" target="_blank">File Descripter / open / read</a>
- <a href="https://www.geeksforgeeks.org/static-variables-in-c/" target="_blank">Static Variables in C</a>
