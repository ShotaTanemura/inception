#! /bin/bash

set -ex;

config_file="/etc/nginx/conf.d/default.conf"

sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" "$config_file"

mkdir -p /etc/nginx/ssl
openssl genrsa -out /etc/nginx/ssl/server.key -passout pass: 2048
openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr -subj "/C=JP/ST=Tokyo/L=Minato/O=42Tokyo/OU=42Tokyo/CN=${DOMAIN_NAME}"
openssl x509 -days 3650 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt

nginx -g 'daemon off;'
