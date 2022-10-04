FROM ghcr.io/linuxserver/baseimage-rdesktop-web:focal

ARG OBSIDIAN_VERSION
LABEL maintainer="Cowboylaserkittenjetshark"

ENV TITLE=obsidian

RUN \
  echo "**** Install Obsidian ****" \
  && curl -Lo obsidian.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb \
  && apt-get update \
  && apt-get install -qy --no-install-recommends ./obsidian.deb \
  && echo "**** Cleaning Up ****" \
  && apt-get autoclean \
  && rm -rf /obsidin.deb

COPY /root /
EXPOSE 3000
VOLUME /config
