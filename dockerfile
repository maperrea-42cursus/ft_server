FROM debian:buster

RUN apt update

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt install -y wget

RUN apt install -y openssl
ADD srcs/ssl.sh /ssl.sh
RUN /bin/sh /ssl.sh

RUN apt install -y nginx
ADD srcs/nginx_template.conf /nginx_template.conf
RUN apt install -y gettext-base
ARG AUTOINDEX=off
RUN envsubst '$AUTOINDEX' < /nginx_template.conf > /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN rm -f /etc/nginx/sites-enabled/default
RUN nginx -t

RUN apt install -y mariadb-server mariadb-client

RUN apt install -y php php7.3-fpm php7.3-mysql php-json php-mbstring php-xml

RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz
RUN mkdir /usr/share/nginx/html/phpmyadmin
RUN tar -xf phpMyAdmin-latest-english.tar.gz --strip-components=1 -C /usr/share/nginx/html/phpmyadmin

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xf /latest.tar.gz -C usr/share/nginx/html
COPY --chown=www-data:www-data srcs/wp-config.php usr/share/nginx/html/wordpress/wp-config.php
ADD srcs/wordpress.sql /wordpress.sql

EXPOSE 80
EXPOSE 443

ADD srcs/init.sh /init.sh
CMD ["/bin/sh", "/init.sh"]
