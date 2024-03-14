# sshportforward
docker container for forwarding ssh connections

The docker image exposes port 8080.

## Properties

| Property | Default | Description|
| --- | --- | --- |
| SSH_USERNAME | username | |
| SSH_PASSWORD | password | |
| SSH_SERVER_IP | 127.0.0.1 | |
| SSH_BIND_ADDRESS | 127.0.0.1 | |
| SSH_PORT | 80 | |
| SSH_HOST_IP | 0.0.0.0 | |
| SSH_HOST_PORT | 8080 | |
| SERVER_ALIVE_INTERVAL | 300 | [ssh config ServerAliveInterval](http://man.openbsd.org/ssh_config#ServerAliveInterval) |
| SERVER_ALIVE_COUNT_MAX | 0 | [ssh config ServerAliveCountMax](http://man.openbsd.org/ssh_config#ServerAliveCountMax) |

## Example
including traefik v 1.7 configuration
```
version: 2
services:
  sshcontainer:
    container_name: sshcontainer
    image: 4n4n4s/sshportforward
    restart: unless-stopped
    networks:
      - traefik_network
    environment:
     - SSH_USERNAME=username
     - SSH_PASSWORD=password
     - SSH_SERVER_IP=192.168.1.1
     - SSH_BIND_ADDRESS=0.0.0.0
     - SSH_PORT=80
     - SSH_HOST_IP=0.0.0.0
     - SSH_HOST_PORT=8080
    labels:
      - traefik.enable=true
      - traefik.protocol=https
      - traefik.port=8080
      - traefik.frontend.rule=Host:mydomain.local
      - traefik.frontend.entryPoints=https
```