FROM ubuntu:latest AS base

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates apt-transport-https nginx apt-mirror cron

RUN mkdir -p /var/www/html/ubuntu
RUN mkdir -p /var/www/html/var
RUN chown -R www-data:www-data /var/www
RUN cp /var/spool/apt-mirror/var/postmirror.sh /var/www/html/var/postmirror.sh
RUN rm /var/www/html/index.nginx-debian.html

COPY src/mirror.list /etc/apt/mirror.list
#RUN /usr/bin/apt-mirror
RUN echo '07 03 * * * /usr/bin/apt-mirror' > /etc/cron.daily/update-mirror

COPY src/entrypoint.sh /usr/bin/entrypoint.sh
RUN rm -rf /etc/nginx/*
COPY src/nginx.conf /etc/nginx/

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
CMD [ "/usr/bin/entrypoint.sh" ]
