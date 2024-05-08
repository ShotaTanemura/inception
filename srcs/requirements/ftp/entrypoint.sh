#! /bin/bash

set -ex

if [ ! -f "/etc/vsftpd.userlist" ]; then

    adduser $FTP_USER_NAME --disabled-password
    echo $FTP_USER_NAME:$FTP_USER_PASS | chpasswd
    chown -R $FTP_USER_NAME:$FTP_USER_NAME /var/www/html

    mkdir -p /etc/vsftpd/
    echo $FTP_USER_NAME | tee -a /etc/vsftpd.userlist

fi

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
