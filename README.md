# vscode-tunnel

This is an automated build for [reverie89/vscodetunnel](https://hub.docker.com/r/reverie89/vscode-tunnel/).

Checks daily for updates to the [vscode binary](https://github.com/microsoft/vscode).

# About

[VSCode Remote Tunnels](https://code.visualstudio.com/docs/remote/tunnels) allow you to connect to a remote machine, like a desktop PC or virtual machine (VM), via a secure tunnel. You can connect to the remote machine from a VS Code client anywhere, without the requirement of SSH.

After starting the container, check the logs for the link and instruction to authenticate with your GitHub account to connect to the tunnel.

## Supports [dev containers](https://code.visualstudio.com/docs/devcontainers/containers) thanks to [cruizba's Docker-in-Docker](https://hub.docker.com/r/cruizba/ubuntu-dind)

Add to compose file to use: `runtime: sysbox-runc` or use `privileged: true` (INSECURE)

Prerequisite to using `runtime: sysbox-runc`: [Install sysbox](https://github.com/nestybox/sysbox/blob/master/docs/user-guide/install-package.md#installing-sysbox)

## Usage example
docker-compose.yaml
```
services:
  vscode:
    image: reverie89/vscode-tunnel
    container_name: vscode-tunnel
    restart: unless-stopped
    hostname: YOUR-MACHINE-NAME
    runtime: sysbox-runc
    volumes:
      - /path/to/vscode:/root
```

**Note: Children containers (dev containers) are destroyed when you destroy the parent container (vscode-tunnel)**