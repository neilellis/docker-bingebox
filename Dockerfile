FROM ipsq/dind:latest
MAINTAINER Martijn Riemers <martijn@riemers.me>

## TODO Add volumes so this image can be extended by custom configurations
## TODO Add master data container

## Installing Docker Compose
ADD https://github.com/docker/compose/releases/download/1.3.3/docker-compose-linux-x86_64 /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

ADD etc/ /etc/
ADD bingebox/ /bingebox/

RUN chmod +x /etc/my_init.d/dind.sh
RUN chmod +x /etc/service/bingebox/run

EXPOSE 80

CMD ["/sbin/my_init"]