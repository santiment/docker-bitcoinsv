FROM ubuntu:19.04
MAINTAINER Valentin Mihov <valentin.m@santiment.net>

RUN apt-get update
RUN apt-get install -y wget

ENV BITCOIN_SV_VERSION=0.1.1
ENV BITCOIN_SV_SHASUM="6a537c7b050594c3f4e674abfd925dfdf6d267af530a83581354362589dcfb79  bitcoin-sv-${BITCOIN_SV_VERSION}-x86_64-linux-gnu.tar.gz"

RUN wget https://download.bitcoinsv.io/bitcoinsv/${BITCOIN_SV_VERSION}/bitcoin-sv-${BITCOIN_SV_VERSION}-x86_64-linux-gnu.tar.gz
RUN echo "${BITCOIN_SV_SHASUM}" | sha256sum -c
RUN tar -xzf *.tar.gz

WORKDIR /bitcoin-sv-${BITCOIN_SV_VERSION}/bin

EXPOSE 8332 8333 18332 18333 28332

ENTRYPOINT ["./bitcoind"]
