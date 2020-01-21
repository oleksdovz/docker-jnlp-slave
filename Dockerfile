FROM jenkins/slave:latest

ARG version
MAINTAINER Oleksiy Dovz <oleksdovz@gmail.com>

USER root
COPY jenkins-agent /usr/local/bin/jenkins-agent
RUN chmod +x /usr/local/bin/jenkins-agent &&\
    ln -s /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave

RUN apk update && apk add sudo makefile
ENTRYPOINT ["jenkins-agent"]

