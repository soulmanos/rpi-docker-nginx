# aws-docker-nginx
Docker Build repo for Customised Nginx

# 1) Setup directory to run nginx container from
sudo mkdir /data && cd /data

# 2) Clone this repo into /data && cd into it
git clone https://github.com/soulmanos/rpi-docker-nginx.git && cd rpi-docker-nginx

# 3) Generate Self-Signed Certificates for RPI-Nginx Build
sudo apt-get install openssl
sudo mkdir -p /etc/ssl/localcerts
openssl req -new -x509 -days 3650 -nodes -out /etc/ssl/localcerts/autosigned.crt -keyout /etc/ssl/localcerts/autosigned.key
chmod 600 /etc/ssl/localcerts/*

# 4) Install apache-tools to install htpasswd
sudo apt-get install -y apache2-utils

# 5) Copy new certs from localcerts into $PWD/certs/ directory
cp /etc/ssl/localcerts/* $PWD/certs/

# 6) Create .htpasswd file in $PWD/config/
sudo htpasswd -c $PWD/config/.htpasswd pi

# 7) Build the docker image
docker build -t soulmanos/rpi-docker-nginx .

# 8) Run the image
$PWD/start.sh
