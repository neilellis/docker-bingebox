FROM phusion/baseimage:latest
MAINTAINER Martijn Riemers <martijn@riemers.me>

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN apt-get install -qy software-properties-common && \
    add-apt-repository ppa:deluge-team/ppa && \
    apt-get update -q && \
    apt-get install -qy deluged deluge-web && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /etc/service/deluge
ADD start.sh /etc/service/deluge/run
RUN chmod +x /etc/service/deluge/run

VOLUME ["/data"]

# Torrent port
EXPOSE 53160
EXPOSE 53160/udp

# WebUI
EXPOSE 8112

# Daemon
EXPOSE 58846

CMD ["/sbin/my_init"]