FROM ubuntu:latest

ENV ROOT_PASSWORD nar.hasten.blev.ledsen.sag.han.rott
ENV AUTHORIZED_KEYS **None**

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config

RUN mkdir /scripts

COPY ./run.sh /scripts/run.sh

EXPOSE 22

CMD ["/scripts/run.sh"]
