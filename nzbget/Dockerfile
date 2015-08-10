FROM phusion/baseimage:latest
MAINTAINER Martijn Riemers <martijn@riemers.me>

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

ENV VERSION 15.0

RUN apt-get update -q && \
    apt-get install -qy build-essential pkg-config libxml2-dev libncurses5-dev libsigc++-2.0-dev libpar2-dev libssl-dev p7zip unrar && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD http://downloads.sourceforge.net/project/nzbget/nzbget-stable/$VERSION/nzbget-$VERSION.tar.gz /tmp/nzbget.tar.gz

RUN tar xf /tmp/nzbget.tar.gz && \
    rm /tmp/nzbget.tar.gz && \
    cd /nzbget-$VERSION && \
    ./configure && \
    make && \
    make install && \
    rm -rf /nzbget-$VERSION

RUN mkdir /etc/service/nzbget
ADD start.sh /etc/service/nzbget/run
RUN chmod +x /etc/service/nzbget/run

VOLUME ["/data"]

EXPOSE 6789

CMD ["/sbin/my_init"]