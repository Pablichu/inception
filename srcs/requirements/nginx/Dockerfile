FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl

#COPY ./conf/nginx.conf /

ENTRYPOINT [ "nginx", "-g", "daemon off;"]
