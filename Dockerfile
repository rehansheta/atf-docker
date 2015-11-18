FROM ubuntu:14.04 
MAINTAINER Rehana Begam "https://github.com/rehansheta" 

RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN apt-get install -y git python2.7 rabbitmq-server python-setuptools python-oslo.config 
RUN apt-get install -y python-pika python-paramiko python-reportlab python-stevedore postfix

EXPOSE 22 5672 4369 25672
CMD ["/usr/sbin/sshd", "-D"]
