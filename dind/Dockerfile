FROM python:2.7.15-slim-jessie

LABEL maintainer="Thomas Grimonet"
LABEL com.example.version="1.0"
LABEL vendor1="Inetsix"
LABEL com.example.release-date="2019-01-11"
LABEL com.example.version.is-production="True"

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -qq -y git \
    vim \
    sshpass \
    openssh-client \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    software-properties-common \
    && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install docker-ce -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    pip install ansible && \
    pip install jxmlease
