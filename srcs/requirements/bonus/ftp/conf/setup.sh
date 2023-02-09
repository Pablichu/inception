sed -i "/^#/d" /etc/vsftpd/vsftpd.conf && \
sed -i "seccomp_sandbox=NO" /etc/vsftpd/vsftpd.conf && \
sed -i "local_enable=NO" /etc/vsftpd/vsftpd.conf && \
sed -i "anon_upload_enable=YES" /etc/vsftpd/vsftpd.conf && \
sed -i "write_enable=YES" /etc/vsftpd/vsftpd.conf && \
sed -i "anon_mkdir_write_enable=YES" /etc/vsftpd/vsftpd.conf && \
sed -i "anon_root=/var/www/html" /etc/vsftpd/vsftpd.conf && \
sed -i "pasv_enable=YES" /etc/vsftpd/vsftpd.conf && \
sed -i "pasv_max_port=21110" /etc/vsftpd/vsftpd.conf && \
sed -i "pasv_min_port=21100" /etc/vsftpd/vsftpd.conf
chown ftp /var/www/html/ && \
chmod 744 /var/www/html/

exec /sbin/tini -- /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf