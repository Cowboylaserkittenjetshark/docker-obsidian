# docker-obsidian
[![Docker](https://github.com/Cowboylaserkittenjetshark/docker-obsidian/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/Cowboylaserkittenjetshark/docker-obsidian/actions/workflows/docker-publish.yml) [![Update Obsidian Version](https://github.com/Cowboylaserkittenjetshark/docker-obsidian/actions/workflows/obsidian-version.yml/badge.svg)](https://github.com/Cowboylaserkittenjetshark/docker-obsidian/actions/workflows/obsidian-version.yml)

A web accessible Obsidian Docker container

### Running (Docker compose):
```yaml
version: "2.1"
services:
  obsidian:
    image: ghcr.io/cowboylaserkittenjetshark/docker-obsidian:latest
    container_name: obsidian
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/New_York
    volumes:
      - ~/Documents/Obsidian:/config/vault
      - ./config:/config
    ports:
      - 3000:3000
    restart: unless-stopped
```
    
### Build locally to use a different version of Obsidian:
```shell
docker build -t ghcr.io/cowboylaserkittenjetshark/docker-obsidian:latest --build-arg OBSIDIAN_VERSION=<version> .
```

### Credits
[linuxserver/docker-kdenlive](https://github.com/linuxserver/docker-kdenlive) - Used as refrence \
[Gist from swinton](https://gist.github.com/swinton/03e84635b45c78353b1f71e41007fc7c) - Used for auto updating Obsidian version
