FROM alpine:3.7

ENV HOST HOSTNAME

RUN apk add --update --no-cache \
    openssl util-linux strongswan bash coreutils

COPY /root /

RUN rm -f /etc/ipsec.secrets \
    && ln -s /config/ipsec.secrets /etc/ipsec.secrets \
    && mv -f /app/*.conf /etc/

EXPOSE 500/udp 4500/udp

ENTRYPOINT [ "/app/entrypoint.sh" ]
