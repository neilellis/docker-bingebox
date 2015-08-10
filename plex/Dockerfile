FROM phusion/baseimage:latest
MAINTAINER Martijn Riemers <martijn@riemers.me>

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen $LANG

RUN apt-get update -q && \
    apt-get install -qy curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L --retry 10 $(curl -Ls --retry 10 https://plex.tv/downloads | grep -o '[^"'"'"']*amd64.deb' | grep -v binaries) -o plexmediaserver.deb && \
    dpkg -i plexmediaserver.deb && \
    rm -f plexmediaserver.deb

VOLUME /config
VOLUME /media

RUN chown plex:plex /config

ENV PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS 6
ENV PLEX_MEDIA_SERVER_MAX_STACK_SIZE 3000

ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR /config

ENV PLEX_MEDIA_SERVER_HOME /usr/lib/plexmediaserver
ENV LD_LIBRARY_PATH /usr/lib/plexmediaserver
ENV TMPDIR /tmp

RUN mkdir /etc/service/plex
ADD start.sh /etc/service/plex/run
RUN chmod +x /etc/service/plex/run

EXPOSE 32400

CMD ["/sbin/my_init"]