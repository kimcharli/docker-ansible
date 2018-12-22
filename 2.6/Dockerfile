FROM python:2.7-alpine3.6 

RUN apk add --update --no-cache python-dev libffi-dev py-pip openssh-client sshpass build-base libssl1.0 openssl-dev && \
    rm -rf /var/cache/apk/* && \
    pip install ansible==2.6.* && \
    pip install jxmlease
