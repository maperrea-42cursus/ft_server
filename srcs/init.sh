#!/bin/sh

service php7.3-fpm start
service nginx start
service mysql start
mysqladmin --user=root password "root"
mysql -uroot -proot < /wordpress.sql

sleep infinity && wait
