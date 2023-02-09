sed -i "/^#/d" /etc/vsftpd/vsftpd.conf && \
sed -i "3 a define seccomp_sandbox=NO" /etc/vsftpd/vsftpd.conf && \
sed -i "4 a define local_enable=NO" /etc/vsftpd/vsftpd.conf && \
sed -i "5 a define anon_upload_enable=YES" /etc/vsftpd/vsftpd.conf && \
sed -i "6 a define write_enable=YES" /etc/vsftpd/vsftpd.conf && \
sed -i "7 a define anon_mkdir_write_enable=YES" /etc/vsftpd/vsftpd.conf && \
sed -i "8 a define anon_root=/var/www/html" /etc/vsftpd/vsftpd.conf && \
sed -i "9 a define pasv_enable=YES" /etc/vsftpd/vsftpd.conf && \
sed -i "10 a define pasv_max_port=21110" /etc/vsftpd/vsftpd.conf && \
sed -i "11 a define pasv_min_port=21100" /etc/vsftpd/vsftpd.conf
chown ftp /var/www/html/ && \
chmod 744 /var/www/html/

exec /sbin/tini -- /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf