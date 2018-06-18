FROM python:2.7.15-slim-jessie

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -qq -y vim sshpass && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    ln -s /usr/local/bin/python /usr/bin/python && \
    pip install ansible~=2.4.0 && \
    pip install jxmlease &&\
    pip install junos-eznc && \
    ansible-galaxy install Juniper.junos
