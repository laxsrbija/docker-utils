FROM ubuntu:20.04

ENV JENKINS_VERSION 2.249.3

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN truncate -s0 /tmp/preseed.cfg; \
    echo "tzdata tzdata/Areas select Europe" >> /tmp/preseed.cfg; \
    echo "tzdata tzdata/Zones/Europe select Belgrade" >> /tmp/preseed.cfg; \
    debconf-set-selections /tmp/preseed.cfg && \
    rm -f /etc/timezone /etc/localtime \
	&& apt update && apt install default-jdk wget -y \
	&& mkdir /opt/jenkins \
	&& mkdir /opt/jenkins/shared \
	&& wget -q https://ftp.halifax.rwth-aachen.de/jenkins/war-stable/$JENKINS_VERSION/jenkins.war -P /opt/jenkins

WORKDIR /opt/jenkins

EXPOSE 8080
CMD ["/usr/bin/java", "-jar", "jenkins.war"]
