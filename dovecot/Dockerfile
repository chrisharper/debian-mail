FROM debian
MAINTAINER Chris Harper

RUN apt-get update -q 
RUN apt-get upgrade -y
RUN apt-get install -y  dovecot-imapd dovecot-lmtpd ca-certificates openssl

RUN adduser --system --home /mnt/vmail --uid 550 --group --disabled-login vmail
RUN adduser dovecot vmail

ADD dovecot.conf /etc/dovecot/dovecot.conf
ADD users /etc/dovecot/users
RUN chmod 640 /etc/dovecot/users && chown root:dovecot /etc/dovecot/users

ADD domain.key /etc/dovecot/domain.key
ADD domain.crt /etc/dovecot/domain.crt
RUN chmod 640 /etc/dovecot/domain.key
RUN chmod 644 /etc/dovecot/domain.crt

RUN update-ca-certificates

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
