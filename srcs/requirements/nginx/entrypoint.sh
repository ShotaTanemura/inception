#! /bin/bash

set -ex;

config_file="/etc/nginx/conf.d/default.conf"

sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" "$config_file"

if find /etc/nginx/ssl/server.key; [ "$?" -ne 0 ]; then
	mv /etc/nginx/ssl/*.key /etc/nginx/ssl/server.key
fi
if find /etc/nginx/ssl/server.crt; [ "$?" -ne 0 ]; then
	mv /etc/nginx/ssl/*.crt /etc/nginx/ssl/server.crt
fi

exec nginx -g 'daemon off;'
