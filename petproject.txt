### Base Image
FROM rockylinux:8

### Owner of the Docker configuration file
LABEL maintainer="shubham.soni@example.com"

### Running OS update and installing packages
RUN dnf -y update && \
    dnf -y install httpd git wget zip unzip net-tools && \
    dnf clean all

### Set working directory
WORKDIR /opt/

### Clone the developer website repository
RUN git clone https://github.com/Shubhamsoni024/petproject.git

### Copy website files to Apache DocumentRoot
RUN cp -rvf petproject/* /var/www/html/

### Remove Dockerfile inside the DocumentRoot (if exists)
RUN rm -f /var/www/html/Dockerfile || true

### Environment variable
ENV myname="shubham_webhost"

### Expose Apache port
EXPOSE 80

### Start Apache server in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
