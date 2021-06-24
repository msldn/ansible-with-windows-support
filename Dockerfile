FROM ubuntu:bionic

 

ENV DEBIAN_FRONTEND="noninteractive"

 

RUN apt-get update && \
        apt-get upgrade -y && \
        apt-get -y install software-properties-common 

 

RUN apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get update && \
    apt-get -y install \
    ssh \
    sshpass \
    python3-pip \
    python3-winrm \
    kinit \
    krb5-user \
    libpam-krb5 \
    libpam-ccreds \
    auth-client-config \
    ansible && \
    ansible --version

 

RUN apt-get -y install python-pip \
    dnsutils \
    krb5-config \
    libkrb5-dev && \
    pip install pywinrm && \
    pip install kerberos


RUN mv /etc/krb5.conf /etc/krb5.conf || echo "no krb5.conf detected"

COPY krb5.conf /etc/krb5.conf


ENV KRB5_CONFIG="/app/krb5.conf"
