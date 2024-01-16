# Use the official Alpine Linux image as the base image
FROM alpine:latest

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword
ENV POSTGRES_DB=mydatabase

# Update and install PostgreSQL
RUN apk update && \
    apk add postgresql postgresql-client

# Initialize the PostgreSQL database cluster
RUN mkdir -p /run/postgresql && chown -R postgres:postgres /run/postgresql
USER postgres
RUN initdb -D /var/lib/postgresql/data

# Expose the PostgreSQL port
EXPOSE 5432

# Start PostgreSQL
ENTRYPOINT postgres -D /var/lib/postgresql/data