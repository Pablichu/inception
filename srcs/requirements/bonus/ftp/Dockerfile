FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
		vsftpd \
		tini

RUN sed -i "/^#/d" /etc/vsftpd/vsftpd.conf && \
	echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf && \
	echo "listen=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "local_enable=NO" >> /etc/vsftpd/vsftpd.conf && \
	echo "anonymous_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "anon_upload_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "anon_mkdir_write_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "anon_root=/home/ftp" >> /etc/vsftpd/vsftpd.conf

ENTRYPOINT [ "/sbin/tini", "--", "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]