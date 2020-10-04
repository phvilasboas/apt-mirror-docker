FROM debian:stretch
LABEL maintainer="Pedro Henrique Vilas Boas <pedro@vilasboas.eti.br>"
COPY src/entrypoint.sh /opt/entrypoint.sh
RUN apt-get update -q \
  && \
    apt install -y -qq apt-mirror dpkg-dev apache2 gzip \
  && \
    apt-get autoremove \
  && \
    rm -rf /var/cache/apt/* \
  && \
    mkdir -p /mnt/mirror/debian \
  && \
    touch /var/log/cron.log \
  && \
    chmod u+x /opt/entrypoint.sh
COPY src/mirror.list /etc/apt/mirror.list
COPY src/000-default.conf /etc/apache2/sites-enabled/000-default.conf
RUN mkdir -p /var/spool/apt-mirror/mirror/http.debian.net/debian/
RUN ln -s /var/spool/apt-mirror/mirror/http.debian.net/debian/ /var/www/debian
RUN chown www-data:www-data /var/www/debian
VOLUME ["/mnt/mirror/debian"]
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/opt/entrypoint.sh"]
