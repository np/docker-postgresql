FROM base/arch
MAINTAINER Nicolas Pouillard

RUN pacman --noconfirm -Syu postgresql vim htop sudo

ADD postgresql.conf /data/postgresql.conf
ADD pg_hba.conf     /data/pg_hba.conf
ADD start.sh        /start.sh

RUN chown root:root /start.sh

VOLUME ["/data"]
EXPOSE 5432
CMD ["/start.sh"]
