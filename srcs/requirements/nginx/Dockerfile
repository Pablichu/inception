FROM alpine:3.15.6

RUN apk add openssl
RUN apk add nginx


RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./conf/nginx.conf /etc/nginx