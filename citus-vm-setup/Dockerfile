FROM ubuntu
RUN apt-get update && apt-get install -y curl wget vim
RUN curl https://install.citusdata.com/community/deb.sh | bash
RUN curl https://dl.2ndquadrant.com/default/release/get/deb | bash
RUN apt install -y --reinstall base-files lsb-release lsb-base
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
RUN apt-get update
RUN apt-get install -y postgresql-9.6
RUN apt-get install -y postgresql-9.6-citus-7.4
RUN apt-get install -y postgresql-9.6-pglogical
RUN pg_conftool 9.6 main set shared_preload_libraries 'citus, pglogical'
RUN pg_conftool 9.6 main set listen_addresses '*'
RUN pg_conftool 9.6 main set wal_level logical
USER postgres
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE EXTENSION citus;" &&\
    psql --command "CREATE EXTENSION pglogical;"
COPY pg_hba.conf /etc/postgresql/9.6/main/pg_hba.conf
EXPOSE 5432
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
CMD ["/usr/lib/postgresql/9.6/bin/postgres", "-D", "/var/lib/postgresql/9.6/main", "-c", "config_file=/etc/postgresql/9.6/main/postgresql.conf"]
