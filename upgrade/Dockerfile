FROM d.ail/pg
MAINTAINER Nicolas Pouillard
VOLUME ["/dataold"]
USER root
RUN pacman --noconfirm --needed -Syu postgresql-old-upgrade supervisor
USER postgres
ENV PGBINOLD  /opt/pgsql-9.2/bin
ENV PGBINNEW  /usr/bin
ENV PGDATAOLD /dataold
ENV PGDATANEW /data
ADD supervisord.conf /run/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/run/supervisord.conf"]
