FROM debian
MAINTAINER Chris Harper

RUN apt-get update -q 
RUN apt-get upgrade -y
RUN apt-get install -y  spamassassin
ADD spamassassin /etc/default/spamassassin

RUN adduser --system --home /mnt/vmail --uid 550 --group --disabled-login vmail

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

