FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client

COPY ./conf/setup.sh /tmp/setup.sh

ENTRYPOINT [ "sh", "/tmp/setup.sh" ]