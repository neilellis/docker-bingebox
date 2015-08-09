FROM mono:latest
MAINTAINER Martijn Riemers <martijn@riemers.me>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
    echo "deb http://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list && \
    apt-get update -q && \
    apt-get install -qy nzbdrone && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/data"]

EXPOSE 8989
EXPOSE 9898

ADD start.sh /
RUN chmod +x start.sh

ENTRYPOINT ["/start.sh"]