FROM alpine:3.8

LABEL maintainer="mattias.rundqvist@icloud.com"

ENV HOST HOSTNAME

RUN apk add --update --no-cache \
    openssl strongswan bash coreutils util-linux

COPY /root /

RUN rm -f /etc/ipsec.secrets \
    && ln -s /config/ipsec.secrets /etc/ipsec.secrets

EXPOSE 500/udp 4500/udp

ENTRYPOINT [ "/app/entrypoint.sh" ]
