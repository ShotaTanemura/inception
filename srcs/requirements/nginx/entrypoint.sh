#! /bin/bash

set -ex;

config_file="/etc/nginx/conf.d/default.conf"

sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" "$config_file"

if find /etc/nginx/ssl/server.key; [ "$?" -neq 0 ]; then
	mv /etc/nginx/ssl/*.key /etc/nginx/ssl/server.key
fi
if find /etc/nginx/ssl/server.crt; [ "$?" -neq 0 ]; then
	mv /etc/nginx/ssl/*.crt /etc/nginx/ssl/server.crt
fi

nginx -g 'daemon off;'
