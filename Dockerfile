FROM jenkins/slave:latest

ARG version
MAINTAINER Oleksiy Dovz <oleksdovz@gmail.com>

USER root
COPY jenkins-agent /usr/local/bin/jenkins-agent
RUN chmod +x /usr/local/bin/jenkins-agent &&\
    ln -s /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave

RUN apt update && apt install sudo make python -y && apt  clean all
ENTRYPOINT ["jenkins-agent"]

