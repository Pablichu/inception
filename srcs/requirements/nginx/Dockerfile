FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl; \
        mkdir /etc/sslcerts; \
        openssl req -x509 -sha256 -days 356 \
                -nodes -newkey rsa:2048 \
                -subj "/CN=$DOMAIN_NAME/C=SP/L=MADRID" \
                -keyout /etc/sslcerts/private.key -out /etc/sslcerts/certificate.crt 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT [ "nginx", "-g", "daemon off;"]
