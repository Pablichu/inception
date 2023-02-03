FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
		vsftpd \
		tini

RUN echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf

ENTRYPOINT [ "/sbin/tini", "--", "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]