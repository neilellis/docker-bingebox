FROM ipsq/dind:latest
MAINTAINER Martijn Riemers <martijn@riemers.me>

## TODO Add volumes so this image can be extended by custom configurations

## Installing Docker Compose
ADD https://github.com/docker/compose/releases/download/1.3.3/docker-compose-linux-x86_64 /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

ADD . /

RUN chmod +x /etc/my_init.d/bingebox.sh

EXPOSE 80

CMD ["/sbin/my_init"]