ARG DEBIAN_VERSION=bookworm-slim
FROM debian:${DEBIAN_VERSION}

ARG HYPERHDR_VERSION
ARG ARCH

RUN apt-get update && apt-get install -y wget && \
    wget https://github.com/awawa-dev/HyperHDR/releases/download/v${HYPERHDR_VERSION}/HyperHDR-${HYPERHDR_VERSION}-Linux-${ARCH}.deb -O /tmp/hyperhdr.deb && \
    apt install -y /tmp/hyperhdr.deb && \
    rm /tmp/hyperhdr.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/share/hyperhdr/bin
ENTRYPOINT /usr/bin/hyperhdr
