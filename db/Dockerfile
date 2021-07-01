FROM postgres:12
# FROM ubuntu:20.04
# RUN apt update && apt -y install postgresql-12 postgresql-client-12


# COPY ./init.sql /docker-entrypoint-initdb.d/init.sql

# # create zope user
# RUN groupadd -r --gid 1000 docker && useradd --no-log-init -r -g docker --uid 1000 docker
# RUN mkdir "/data/"

# RUN chown docker /data/
# USER postgres
# EXPOSE 25643
# RUN    /etc/init.d/postgresql start

# RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/12/main/pg_hba.conf


# VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# CMD ["/usr/lib/postgresql/12/bin/postgres", "-D", "/var/lib/postgresql/12/main", "-c", "config_file=/etc/postgresql/12/main/postgresql.conf"]
# #ENTRYPOINT ["docker-entrypoint.sh", "postgres"]
#ENTRYPOINT ["su","-","docker","&&","pg_ctl","-D","/data/postgres","-l","logfile","-o"," -p 56666","start"]