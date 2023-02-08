FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
		vsftpd \
		tini

RUN sed -i "/^#/d" /etc/vsftpd/vsftpd.conf && \
	echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf && \
	echo "local_enable=NO" >> /etc/vsftpd/vsftpd.conf && \
	echo "anon_upload_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "anon_mkdir_write_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "anon_root=/var/www/html" >> /etc/vsftpd/vsftpd.conf && \
	echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "pasv_max_port=21110" >> /etc/vsftpd/vsftpd.conf && \
	echo "pasv_min_port=21100" >> /etc/vsftpd/vsftpd.conf && \
	chown ftp /var/www/html/wordpress && \
	chmod 777 /var/www/html/wordpress

ENTRYPOINT [ "/sbin/tini", "--", "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]