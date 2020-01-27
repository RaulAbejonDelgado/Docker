#Download base image ubuntu 16.04
FROM ubuntu:16.04

# Update Software repository
RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install nano -y
RUN apt-get install inetutils-ping -y


RUN mkdir /var/run/sshd 
RUN useradd remote_user && echo "remote_user:pass" | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN	mkdir -p /home/remote_user/.ssh 
RUN	chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user && \
    chmod 600 /home/remote_user/.ssh/authorized_keys
    
RUN apt-get update && apt-get install -y mysql-client && rm -rf /var/lib/apt

Run usermod -aG sudo remote_user
RUN echo 'your_user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get update && apt-get install -y python-pip && pip install awscli
RUN apt-get update && apt-get install -y git-core

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
