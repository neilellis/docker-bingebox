FROM ubuntu:latest
MAINTAINER Martijn Riemers <martijn@riemers.me>

RUN add-apt-repository -y ppa:nginx/stable && \
    apt-get update -q && \
    apt-get install -qy nginx && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    chown -R www-data:www-data /var/lib/nginx

ADD sites-available/bingebox /etc/nginx/sites-available/
RUN rm /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/bingebox /etc/nginx/sites-enabled/bingebox

EXPOSE 80
EXPOSE 443

CMD ["nginx"]