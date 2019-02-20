FROM debian:stretch

ARG GUNBOT_VERSION=v1283
ENV GUNBOT_VERSION ${GUNBOT_VERSION}

RUN apt-get update \
 && apt-get install -y unzip \
 && apt-get clean

WORKDIR /tmp
ADD https://github.com/GuntharDeNiro/BTCT/releases/download/${GUNBOT_VERSION}/lin.zip .

RUN unzip lin.zip \
 && rm -rf lin.zip \
 && rm -rf __MACOSX \
 && mv lin /gunbot \
 && rm /gunbot/config.js

WORKDIR /gunbot

EXPOSE 5000
VOLUME [ "/gunbot/backups", "/gunbot/logs", "/gunbot/json", "/gunbot/config.js" ]

CMD /gunbot/gunthy-linux