FROM python:2.7

RUN apk update && \
    apk add vim sshpass && \
    pip install ansible && \
    pip install botocore && \
    pip install boto && \ 
    pip install boto3 && \ 
    pip install junos-eznc && \
    pip install awscli && \
    ansible-galaxy install Juniper.junos
