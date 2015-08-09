FROM python:2.7
MAINTAINER Martijn Riemers <martijn@riemers.me>

ADD . /

RUN chmod +x /start.sh

VOLUME ["/data"]

EXPOSE 8181

CMD ["/start.sh"]