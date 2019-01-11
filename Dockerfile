FROM python:2.7-alpine3.6 

LABEL maintainer="Thomas Grimonet"
LABEL com.example.version="1.0"
LABEL vendor1="Inetsix"
LABEL com.example.release-date="2019-01-11"
LABEL com.example.version.is-production="True"

RUN apk add --update --no-cache python-dev libffi-dev py-pip openssh-client sshpass build-base libssl1.0 openssl-dev && \
    rm -rf /var/cache/apk/* && \
    pip install ansible && \
    pip install jxmlease
