#!/bin/sh 
touch /mnt/logs/assassin.log ;

/usr/sbin/spamd --create-prefs --max-children 2 --helper-home-dir  \
                --syslog=/mnt/logs/assassin.log \
                --socketpath=/mnt/sockets/spamd --socketgroup=vmail


