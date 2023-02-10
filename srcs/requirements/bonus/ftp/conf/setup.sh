#!/bin/sh

if ! grep -q -F "pasv_enable=YES" "/etc/vsftpd/vsftpd.conf"; then

sed -i "/^#/d" /etc/vsftpd/vsftpd.conf

echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf

echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf
echo "local_root=/var/www/html" >> /etc/vsftpd/vsftpd.conf

echo "ftpd_banner=AAAAAAAAAAAH" >> /etc/vsftpd/vsftpd.conf

echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=21110" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=21100" >> /etc/vsftpd/vsftpd.conf

adduser $FTP_USER --disabled-password
chown $FTP_USER /var/www/html
#chmod 744 /var/www/html

fi

exec /sbin/tini -- /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf