FROM python:2.7.15-slim-jessie

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -qq -y vim sshpass && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    pip install ansible && \
    pip install junos-eznc && \
    ansible-galaxy install Juniper.junos
