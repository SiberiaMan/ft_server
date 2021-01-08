#!bin/bash

service php7.3-fpm start

service mysql start
{
echo "CREATE USER 'dchani'@'localhost';"
echo "CREATE DATABASE IF NOT EXISTS wordpress;"
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'dchani'@'localhost';"
echo "FLUSH PRIVILEGES;"
} | mysql -u root --skip-password

service nginx start

bash
