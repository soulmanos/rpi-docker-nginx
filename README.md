# aws-docker-nginx
Docker Build repo for Customised Nginx

TODO:: Re-build nginx, maybe try checkout the default nginx.conf file and sed some changes

# Generate Self-Signed Certificates for RPI-Nginx Build
sudo apt-get install openssl
sudo mkdir -p /etc/ssl/localcerts
openssl req -new -x509 -days 3650 -nodes -out /etc/ssl/localcerts/autosigned.crt -keyout /etc/ssl/localcerts/autosigned.key
chmod 600 /etc/ssl/localcerts/*

# Install apache-tools to install htpasswd
apt-get install -y apache2-utils

# Copy .htpasswd into /etc/nginx/
