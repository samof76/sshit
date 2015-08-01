FROM ubuntu:latest
MAINTAINER samof76<mad.vijay@gmail.com>

RUN apt-get update && \
apt-get install -y openssh-server && \
mkdir -p /var/run/sshd ; mkdir -p /root/.ssh && chmod 0700 /root/.ssh

ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 0600 /root/.ssh/authorized_keys && chown root. /root/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]

