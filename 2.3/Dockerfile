FROM python:2.7

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -qq -y vim sshpass && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    pip install ansible~=2.3.0 && \
    pip install botocore && \
    pip install boto && \ 
    pip install boto3 && \ 
    pip install junos-eznc && \
    ansible-galaxy install Juniper.junos
