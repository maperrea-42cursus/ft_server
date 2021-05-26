FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx
ADD srcs/default.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
EXPOSE 443
