FROM		debian:buster

MAINTAINER	dchani

RUN			apt-get update && \
			apt-get install -y \
			nginx \
			default-mysql-server \
			php-fpm \
			php-mysql \
			wget \
			openssl \
			&& mkdir /var/www/my_server

# Nginx

COPY		srcs/server.conf /etc/nginx/sites-available/server.conf
RUN			rm -rf /etc/nginx/sites-enabled/default && \
			ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/default

# Phpmyadmin

RUN			wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
			tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
			mv phpMyAdmin-5.0.4-all-languages/ /var/www/my_server/phpmyadmin && \
			rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz

COPY		srcs/config.inc.php	/var/www/my_server/phpmyadmin

# WordPress

RUN			wget https://wordpress.org/latest.tar.gz && \
			tar -xvf latest.tar.gz && \
			mv wordpress /var/www/my_server/ && \
			rm -rf latest.tar.gz

COPY		srcs/wp-config.php /var/www/my_server/wordpress

# SSL for nginx

RUN			mkdir /etc/nginx/ssl && chmod 700 /etc/nginx/ssl && \
			openssl req -x509 \
			-days 3650 \
			-newkey rsa:2048 -nodes \
			-keyout /etc/nginx/ssl/nginx.key \ 
			-out /etc/nginx/ssl/nginx.crt \
			-subj "/C=US/ST=WA/L=Washington DC/O=Administration\
			OU=student/emailAddress=kek@kek.us/CN=my_server.com"

# Start

COPY		srcs/script.sh /usr/local/bin/
COPY		srcs/autoindex.sh /usr/local/bin/

CMD			["bash", "script.sh"]
