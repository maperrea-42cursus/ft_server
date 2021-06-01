FROM debian:buster

RUN apt update

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt install -y wget

RUN apt install -y openssl
ADD srcs/ssl.sh /ssl.sh
RUN /bin/sh /ssl.sh

RUN apt install -y nginx
ADD srcs/default.conf /etc/nginx/nginx.conf
RUN nginx -t

RUN apt install -y mariadb-server mariadb-client

RUN apt install -y php php7.3-fpm php7.3-mysql php-json php-mbstring php-xml
COPY --chown=www-data:www-data srcs/test.php /usr/share/nginx/html/test.php

RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz
RUN mkdir /usr/share/nginx/html/phpmyadmin
RUN tar xzf phpMyAdmin-latest-english.tar.gz --strip-components=1 -C /usr/share/nginx/html/phpmyadmin

EXPOSE 80
EXPOSE 443

ADD srcs/init.sh /init.sh
CMD ["/bin/sh", "/init.sh"]
