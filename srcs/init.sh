#!/bin/sh

service php7.3-fpm start
service nginx start
service mysql start
mysqladmin --user=root password "root"

sleep infinity && wait
