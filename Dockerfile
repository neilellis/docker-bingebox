FROM phusion/baseimage:latest
MAINTAINER Martijn Riemers <martijn@riemers.me>

ENV DELUGE_PASSWORD **GENERATE**
ENV NZBGET_PASSWORD **GENERATE**
ENV SONARR_PASSWORD **GENERATE**
ENV COUCHPOTATO_PASSWORD **GENERATE**
ENV HEADPHONES_PASSWORD **GENERATE**
ENV PLEX_PASSWORD **GENERATE**

## TODO Add volumes so this image can be extended by custom configurations
## TODO Add master data container
## TODO Expose all necessary ports

RUN apt-get update -q && \
    apt-get install -qy curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.7.1 && \
    chmod +x docker-1.7.1 && \
    mv docker-1.7.1 /usr/local/bin/docker

## Installing Docker Compose
ADD https://github.com/docker/compose/releases/download/1.3.3/docker-compose-linux-x86_64 /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

ADD . /
RUN chmod +x /etc/my_init.d/10_bingebox.sh

EXPOSE 80

CMD ["/sbin/my_init"]