docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker build --build-arg AUTOINDEX -t ft_server:latest .
docker run -d -p 80:80 -p 443:443 --name ft_server ft_server:latest 
