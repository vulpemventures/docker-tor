FROM alpine:3.7

EXPOSE 9050

RUN apk --update add tor

COPY tor /etc/tor

ENTRYPOINT ["tor", "-f", "/etc/tor/torrc"]
