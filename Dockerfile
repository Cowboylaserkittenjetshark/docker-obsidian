FROM ghcr.io/linuxserver/baseimage-rdesktop-web:focal

ARG BUILD_DATE
ARG VERSION
ARG OBSIDIAN_VERSION
LABEL maintainer="Cowboylaserkittenjetshark"

ENV TITLE=obsidian

RUN \
  echo "**** Install Obsidian ****" && \
  curl -Lo /usr/bin/obsidian https://github.com$(curl -sL https://github.com/obsidianmd/obsidian-releases/releases/latest | grep -o '"/obsidianmd/obsidian-releases/releases/download/[^"]*.AppImage"' | tail -1 | sed 's/\"//g') \
  curl -Lo obsidian-logo.png https://play-lh.googleusercontent.com/McJwuNc1Gbs8-XrPCH77Ar-qZMGujN6L0_zb_jv_0oBe2vwnmIboESQjPsTSu1uINbg
COPY /root /
EXPOSE 3000
VOLUME /config
