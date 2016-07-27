FROM resin/rpi-raspbian:jessie

MAINTAINER the.soulman.is@gmail.com

# Update apt-get repo's
RUN apt-get update && \
    apt-get install nginx-full

# RUN rm /etc/nginx/sites-enabled/default && \
RUN rm /etc/nginx/nginx.conf

# This copies contents of dir config to /root
COPY config /root

# Make the certs dir and copy over the custom config files
RUN mkdir -p /etc/nginx/certs && \
    mv /root/nginx.conf /etc/nginx/nginx.conf && \
    mv /root/proxy.conf /etc/nginx/proxy.conf && \
    mv /root/.htpasswd /etc/nginx/.htpasswd

# Expose the sites-enabled dir for easy access to 'main' 
# Expose additonal dirs e.g. logs for persistent storage
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Expose ports to the image
EXPOSE 443 80

# Sets running container working directory
WORKDIR /etc/nginx

# Start up the nginx application
CMD ["nginx", "-g", "daemon off;"]
