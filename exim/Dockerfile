FROM debian
MAINTAINER Chris Harper

RUN apt-get update -q 
RUN apt-get upgrade -y
RUN apt-get install -y  exim4-daemon-heavy spf-tools-perl openssl ca-certificates 

RUN adduser --system --home /mnt/vmail --uid 550 --group --disabled-login vmail
RUN adduser Debian-exim vmail

ADD exim4.conf.template /etc/exim4/
RUN update-exim4.conf
RUN service exim4 restart

ADD domain.key /etc/exim4/exim.key
ADD domain.crt /etc/exim4/exim.crt
ADD dkim.key /etc/exim4/dkim.key

RUN chmod 640 /etc/exim4/exim.key
RUN chmod 640 /etc/exim4/exim.crt
RUN chmod 640 /etc/exim4/dkim.key

RUN chgrp Debian-exim /etc/exim4/exim.key
RUN chgrp Debian-exim /etc/exim4/exim.crt
RUN chgrp Debian-exim /etc/exim4/dkim.key

RUN update-ca-certificates
ADD entrypoint.sh /entrypoint.sh
ADD aliases /etc/aliases

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


