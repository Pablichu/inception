FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl; \
        mkdir /etc/sslcerts; \
        openssl req -x509 -sha256 -days 356 \
                -nodes -newkey rsa:2048 \
                -subj "/CN=$DOMAIN_NAME/C=US/L=San Fransisco" \
                -keyout /etc/private.key -out /etc/certificate.crt 

COPY ./conf/nginx.conf /etc/nginx/conf.d

ENTRYPOINT [ "nginx", "-g", "daemon off;"]
