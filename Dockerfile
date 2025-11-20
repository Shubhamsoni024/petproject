### Now we are working the docker component
FROM centos:latest

### Owner of the Docker configuration file
MAINTAINER shubham.soni@example.com

### Running the os update and installing the apache package
RUN yum update -y &&  \
    yum install applydeltarpm httpd git wget zip unzip net-tools -y

## Changing the Working directory
WORKDIR /opt/

### Adding the developer website to the Apache DocumentRoot
RUN git pull https://github.com/Shubhamsoni024/petproject.git

### Copying the configuration files to the main document root to run
RUN cp -rvf  petproject/* /var/www/html/

### Removing the docker file inside of /var/www/html
RUN rm -rf /var/www/html/Dockerfile

### Environment variable
ENV myname shubham_webhost

### Starting the apache configuration
CMD /usr/sbin/httpd -D FOREGROUND

### Exposing the containerPort
EXPOSE 80
