FROM python:2.7
MAINTAINER Martijn Riemers <martijn@riemers.me>

ADD start.sh /

RUN chmod +x /start.sh

VOLUME ["/data"]

ADD config.ini /tmp/config.ini

EXPOSE 8181

CMD ["/start.sh"]