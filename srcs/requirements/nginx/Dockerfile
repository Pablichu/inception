FROM alpine:3.15.6

RUN apk add nginx \
            openssl

#COPY ./conf/nginx.conf /

ENTRYPOINT [ "nginx", "-g", "daemon off;"]
