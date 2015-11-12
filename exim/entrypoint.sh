#!/bin/sh 

touch /mnt/logs/exim_mainlog;
touch /mnt/logs/exim_rejectlog;
touch /mnt/logs/exim_paniclog;
chown -R Debian-exim:Debian-exim /mnt/logs/exim_*;


/usr/sbin/exim4 -bdf -d -q30m;
