FROM debian
MAINTAINER Chris Harper

RUN apt-get update -q 
RUN apt-get upgrade -y

RUN adduser --system --home /mnt/vmail --uid 550 --group --disabled-login vmail


VOLUME /mnt
VOLUME /mnt/logs
VOLUME /mnt/vmail
VOLUME /mnt/sockets

RUN mkdir -p /mnt/vmail/charper.co.uk/charper
RUN chown -R 550:550 /mnt/vmail

ENTRYPOINT exec tail -f /etc/hostname
