FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
		redis

#COPY redis.conf /usr/local/etc/redis/redis.conf
#CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

ENTRYPOINT [ "redis-server" ]