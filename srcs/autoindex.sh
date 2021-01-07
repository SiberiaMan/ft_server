#!bin/bash

NGINX_PATH="/etc/nginx/sites-available/server.conf"

if grep -q "autoindex off;" $NGINX_PATH
then
	echo "autoindex on"
	sed -i -s 's/autoindex off;/autoindex on;/g' $NGINX_PATH
elif grep -q "autoindex on;" $NGINX_PATH
then
	echo "autoindex off"
	sed -i -s 's/autoindex on;/autoindex off;/g' $NGINX_PATH
fi

nginx -s reload
