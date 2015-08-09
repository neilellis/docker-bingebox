FROM python:2.7
MAINTAINER Martijn Riemers <martijn@riemers.me>

ADD CouchPotatoServer /couchpotato/

VOLUME /volumes/couchpotato

EXPOSE 5050

ENTRYPOINT ["python", "/couchpotato/CouchPotato.py"]
CMD ["--data_dir /volumes/couchpotato"]