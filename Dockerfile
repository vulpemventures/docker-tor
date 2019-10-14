FROM alpine:3.7

EXPOSE 9050

RUN apk --update add tor bash su-exec

COPY tor /etc/tor

ENTRYPOINT ["tor", "-f", "/etc/tor/torrc"]
