FROM debian:stretch-slim
MAINTAINER Protik Das <protik77@gmail.com> 
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common


RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    docker-ce \
    docker-ce-cli \
    containerd.io


RUN apt-get install --no-install-recommends --no-install-suggests -y \
    texlive-full \
    python-pygments gnuplot \
    make git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
