FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client

ENTRYPOINT [ "mysql_install_db ;", "mariadb", "start" ]