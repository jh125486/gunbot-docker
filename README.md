# Gunbot Docker image

[![Docker Stars](https://img.shields.io/docker/stars/jh125486/gunbot-docker.svg)](https://hub.docker.com/r/jh125486/gunbot-docker/)
[![Docker Pulls](https://img.shields.io/docker/stars/jh125486/gunbot-docker.svg)](https://hub.docker.com/r/jh125486/gunbot-docker/)

Non-official Gunbot image [available on Docker Hub](https://hub.docker.com/r/jh125486/gunbot-docker/).

Using releases from [GuntharDeNiro/BTCT](https://github.com/GuntharDeNiro/BTCT/releases)

# Usage

```bash
docker run -p 5000:5000 jh125486/gunbot-docker
```

This will store the configuration in `/gunbot`. All Gunbot data lives in there - including config.js and backups.
You will probably want to  bind volumes instead:

```bash
docker run -p 5000:5000 \
  -v ${CONFIG_DIR}/gunbot/config.js:/gunbot/config.js \
  -v ${CONFIG_DIR}/gunbot/json:/gunbot/json \
  -v ${CONFIG_DIR}/gunbot/backups:/gunbot/backups \
  -v ${CONFIG_DIR}/gunbot/logs:/gunbot/logs \
  jh125486/gunbot-docker:v1283
```

Or with `docker-compose.yml`:
```yaml
version: "3"

services:
  gunbot:
    image: jh125486/gunbot:v1283
    container_name: gunbot
    restart: always
    ports:
      - "5000:5000"
    volumes:
      - ${CONFIG_DIR}/gunbot/config.js:/gunbot/config.js
      - ${CONFIG_DIR}/gunbot/json:/gunbot/json
      - ${CONFIG_DIR}/gunbot/backups:/gunbot/backups
      - ${CONFIG_DIR}/gunbot/logs:/gunbot/logs
```