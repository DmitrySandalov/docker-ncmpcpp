#!/bin/sh

echo "get and install docker-compose"
if [ ! -f /usr/local/bin/docker-compose ]; then
    curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose
    chmod +x /tmp/docker-compose
    sudo mv -f /tmp/docker-compose /usr/local/bin/docker-compose
fi

echo "compile ncmpcpp"
docker-compose build

echo "run ncmpcpp"
echo "docker run -it --rm ncmpcpp_ncmpcpp ncmpcpp -h 127.0.0.1"
