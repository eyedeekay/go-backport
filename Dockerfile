FROM golang:1.18.0-buster
RUN echo "deb http://deb.debian.org/debian oldstable main" >> /etc/apt/sources.list &&  \
    apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
        wget \
        *appindicator* \
        gcc \
        make \
        git \
        xz-utils \
        tar \
        && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
