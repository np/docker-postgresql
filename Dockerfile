FROM base/arch
MAINTAINER Nicolas Pouillard

RUN pacman --noconfirm -Syu postgresql vim htop

VOLUME ["/data"]

ADD postgresql.conf /data/postgresql.conf
ADD pg_hba.conf     /data/pg_hba.conf
ADD start.sh        /start.sh

USER   postgres
EXPOSE 5432
CMD    ["/start.sh"]
