FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
		vsftpd \
		tini

ENTRYPOINT [ "tail", "-f", "/dev/null" ]
#ENTRYPOINT [ "/sbin/tini", "--", "/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf" ]