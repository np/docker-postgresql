FROM d.ail/arch
MAINTAINER Nicolas Pouillard

RUN pacman --noconfirm -Syu postgresql

VOLUME ["/data"]

ADD postgresql.conf /postgresql.conf
ADD pg_hba.conf     /pg_hba.conf
ADD start.sh        /start.sh

RUN usermod -d /data postgres ;\
    mkdir -p /run/postgresql ;\
    chown postgres:postgres /run/postgresql

USER postgres

ENV  PGDATA /data
ENV  HOME   /data
ENV  LC_ALL en_US.UTF-8
ENV  LANG   en_US.UTF-8

EXPOSE  5432
CMD     ["/start.sh"]
WORKDIR /data
