openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 365 \
            -nodes \
            -out ft_server.crt \
            -keyout ft_server.key \
            -subj "/C=BE/ST=Brussels/L=Brussels/O=19/OU=Student/CN=www.maperrea.com"
