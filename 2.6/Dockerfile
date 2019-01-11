FROM python:2.7.15-slim-jessie

LABEL maintainer="Thomas Grimonet"
LABEL com.example.version="1.0"
LABEL vendor1="Inetsix"
LABEL com.example.release-date="2019-01-11"
LABEL com.example.version.is-production="True"

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -qq -y openssh-client vim sshpass git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    ln -s /usr/local/bin/python /usr/bin/python && \
    pip install ansible==2.6.* && \
    pip install jxmlease &&\
    pip install junos-eznc && \
    ansible-galaxy install Juniper.junos
