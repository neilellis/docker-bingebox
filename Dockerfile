FROM jpetazzo/dind:latest
MAINTAINER Martijn Riemers <martijn@riemers.me>

## Installing Docker Compose
ADD https://github.com/docker/compose/releases/download/1.3.3/docker-compose-linux-x86_64 /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

ADD . /

ENTRYPOINT ["/bin/start.sh"]