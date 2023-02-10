|#!/bin/sh

if [ ! grep -q "pasv_enable=YES" /etc/vsftpd/vsftpd.conf ]; then
sed -i "/^#/d" /etc/vsftpd/vsftpd.conf
echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf
echo "local_enable=NO" >> /etc/vsftpd/vsftpd.conf
echo "anon_upload_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "anon_mkdir_write_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "anon_root=/var/www/html" >> /etc/vsftpd/vsftpd.conf
echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=21110" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=21100" >> /etc/vsftpd/vsftpd.conf
#chown ftp /var/www/html
#chmod 744 /var/www/html
fi

exec /sbin/tini -- /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf