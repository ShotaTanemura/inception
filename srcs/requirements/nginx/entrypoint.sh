#! /bin/bash

set -ex;

config_file="/etc/nginx/conf.d/default.conf"

sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" "$config_file"

certbot --nginx -d ${DOMAIN_NAME}
certbot renew --dry-run

nginx -g 'daemon off;'
