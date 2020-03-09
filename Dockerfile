FROM alpine:3.11

LABEL maintainer="BlueKrow<ndioses@gmail.com>"

RUN apk --update add git npm && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY scripts /
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]