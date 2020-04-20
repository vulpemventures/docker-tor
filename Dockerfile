FROM ubuntu:19.10

RUN useradd tor

RUN apt-get update && apt-get install -y tor

RUN mkdir -p /var/lib/tor 
RUN chown -R tor:tor /var/lib/tor

COPY torrc /etc/tor/torrc
RUN chown -R tor:tor /etc/tor

USER tor

ENTRYPOINT ["tor"]
CMD ["-f", "/etc/tor/torrc"]