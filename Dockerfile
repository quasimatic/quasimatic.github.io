FROM alpine

ENV HUGO_VERSION 0.17
ENV HUGO_DOWNLOAD hugo_${HUGO_VERSION}_linux-64bit
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux_amd64

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN apk update && apk add py-pygments && rm -rf /var/cache/apk/*

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_DOWNLOAD}.tar.gz /tmp/

RUN  tar -xvzf /tmp/${HUGO_DOWNLOAD}.tar.gz -C /tmp/ && mv /tmp/${HUGO_BINARY}/${HUGO_BINARY} /usr/bin/hugo && rm -rf /tmp/hugo*

RUN mkdir -p "$HOME/.ssh"

RUN echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> "$HOME/.ssh/config"

RUN git config --global user.email "info@quasimatic.com"
RUN git config --global user.name "Quasimatic"

WORKDIR /data
