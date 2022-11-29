FROM alpine:3.15.6

RUN apk add openssl \
            nginx

COPY ./conf/nginx.conf /

CMD [ "nginx" ]