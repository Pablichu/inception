FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
		vsftpd \
		tini

COPY ./conf/setup.sh .

ENTRYPOINT [ "sh", "setup.sh" ]