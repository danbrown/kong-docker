# Get base image
FROM kong:alpine


COPY ./kong.yml /usr/local/kong/declarative/kong.yml

# ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/usr/local/kong/declarative/kong.yml
ENV KONG_DB_UPDATE_FREQUENCY=1m
ENV KONG_DATABASE="postgres"
ENV KONG_PG_HOST="${PGHOST}"
ENV KONG_PG_PORT="${PGPORT}"
ENV KONG_PG_DATABASE="kong-db"
ENV KONG_PG_USER="${PGUSER}"
ENV KONG_PG_PASSWORD="${PGPASSWORD}"
ENV KONG_ADMIN_LISTEN="0.0.0.0:8001, 0.0.0.0:8444 ssl"
# ENV KONG_CASSANDRA_CONTACT_POINTS=kong-database

ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_LISTEN="0.0.0.0:8009, 0.0.0.0:8449 ssl"

RUN kong migrations bootstrap


#EXPOSE "8000:8000"
#EXPOSE "8443:8443"
#EXPOSE "8001:8001"
#EXPOSE "8444:8444"

EXPOSE 8000 8443 8009 8449 3000
