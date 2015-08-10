FROM jpetazzo/dind:latest
MAINTAINER Martijn Riemers <martijn@riemers.me>

## TODO Add volumes so this image can be extended by custom configurations
## TODO Add master data container

## Installing Docker Compose
ADD https://github.com/docker/compose/releases/download/1.3.3/docker-compose-linux-x86_64 /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

ADD bingebox/ /bingebox/
RUN chmod +x /bingebox/start.sh

EXPOSE 80

CMD ["/bingebox/start.sh"]