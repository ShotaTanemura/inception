#! /bin/bash

set -ex;

config_file="/etc/nginx/conf.d/default.conf"

sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" "$config_file"
nginx -g 'daemon off;'
