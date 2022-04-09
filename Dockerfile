FROM golang:1.18.0-buster
RUN echo "deb http://deb.debian.org/debian oldstable main" >> /etc/apt/sources.list &&  \
    echo "deb http://deb.debian.org/debian stable main" >> /etc/apt/sources.list &&  \
    echo "Package: \*" >> /etc/apt/preferences && \
    echo "Pin: release a=olstable" >> /etc/apt/preferences && \
    echo "Pin-Priority: 900" >> /etc/apt/preferences &&  \
    echo "Package: \*" >> /etc/apt/preferences && \
    echo "Pin: release a=buster" >> /etc/apt/preferences && \
    echo "Pin-Priority: 901" >> /etc/apt/preferences &&  \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        *appindicator*dev \
        build-essential \
        libwebkit2gtk-4.0-dev \
        libgtk-3-dev \
        libglib2.0-dev \
        libayatana-appindicator3-dev \
        libolm-dev \
        && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN find / -name '*.pc'