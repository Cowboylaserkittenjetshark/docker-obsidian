FROM ghcr.io/linuxserver/baseimage-rdesktop-web:focal

ARG BUILD_DATE
ARG VERSION
ARG OBSIDIAN_VERSION
LABEL maintainer="Cowboylaserkittenjetshark"

ENV TITLE=obsidian

RUN \
  echo "**** Install Obsidian ****" \
  # && curl -Lo obsidian.deb https://github.com$(curl -sL https://github.com/obsidianmd/obsidian-releases/releases/latest | grep -o '"/obsidianmd/obsidian-releases/releases/download/[^"]*.deb"' | tail -1 | sed 's/\"//g') \
  && curl -Lo obsidian.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb \
  && mkdir -p /root/Desktop \
  && apt-get update \
  && apt-get install -y ./obsidian.deb \
  && cp /usr/share/applications/obsidian.desktop $HOME/Desktop/
COPY /root /
EXPOSE 3000
VOLUME /config
