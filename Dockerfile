# The line below states we will base our new image on the Latest Official centos
FROM centos:7

#
# Identify the maintainer of an image
LABEL maintainer="myname@somecompany.com"

#
# Update the image to the latest packages
#RUN apt-get update && apt-get upgrade -y

#
# Install NGINX to test.
RUN yum install -y epel-release && \
yum install -y nginx


COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /data/www/index.html
VOLUME [ "/data/www" ]

#
# Expose port 80
EXPOSE 80

#
# Last is the actual command to start up NGINX within our Container
CMD ["nginx", "-g", "daemon off;"]

