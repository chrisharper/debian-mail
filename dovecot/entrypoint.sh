#!/bin/sh 

touch /mnt/logs/dovecot.log ;
chown -R dovecot:dovecot /mnt/logs/dovecot.log;

chown -R vmail:vmail /mnt/vmail
chmod -R 770 /mnt/vmail

/usr/sbin/dovecot -F -c /etc/dovecot/dovecot.conf;
