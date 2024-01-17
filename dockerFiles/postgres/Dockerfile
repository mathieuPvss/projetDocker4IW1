FROM alpine:latest

ENV POSTGRES_PASSWORD=toto

# Copy SQL file into the container
COPY init.sql /script/

RUN apk update && \
    apk add postgresql postgresql-client

RUN mkdir -p /run/postgresql && chown -R postgres:postgres /run/postgresql
USER postgres
RUN initdb -D /var/lib/postgresql/data

# Modify pg_hba.conf to allow connections from any IP address with password authentication
RUN echo "host all all 0.0.0.0/0 md5" >> /var/lib/postgresql/data/pg_hba.conf
RUN echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf

# Create the database and the table and insert some data
# start the server PostgreSQL, wait for it to start, execute the script then stop the server
RUN pg_ctl -D /var/lib/postgresql/data start \
    && sleep 1 \
    && psql -U postgres -f /script/init.sql \
    && pg_ctl -D /var/lib/postgresql/data stop

# Set the password for the postgres user
RUN echo "ALTER USER postgres WITH PASSWORD 'toto';" | postgres --single -D /var/lib/postgresql/data -j


EXPOSE 5432

ENTRYPOINT ["postgres", "-D", "/var/lib/postgresql/data"]
