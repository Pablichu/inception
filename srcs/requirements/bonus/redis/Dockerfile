FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
		redis

ENTRYPOINT [ "redis-server", "--protected-mode", "no" ]