FROM base/devel
MAINTAINER Nicolas Pouillard

RUN pacman --noconfirm -Syu postgresql vim htop

VOLUME ["/data"]

ADD postgresql.conf /data/postgresql.conf
ADD pg_hba.conf     /data/pg_hba.conf
ADD start.sh        /start.sh

RUN usermod -d /data postgres

ENV  HOME   /data
USER postgres

ENV  LC_ALL en_US.UTF-8
ENV  LANG   en_US.UTF-8

EXPOSE 5432
CMD    ["/start.sh"]
