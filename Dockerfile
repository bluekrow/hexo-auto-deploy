FROM alpine:3.11

LABEL maintainer="BlueKrow<ndioses@gmail.com>"

RUN apk --update add git npm && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ENTRYPOINT [ "./entrypoint.sh" ]