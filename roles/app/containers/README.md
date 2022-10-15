# TinyNET Ansible Role: `app/containers`

This role installs all containerized apps, including:

- [cloudflared](https://github.com/cloudflare/cloudflared)
- [Gitea](https://gitea.io/)
- [Keycloak](https://www.keycloak.org/)
- [Minflux](https://miniflux.app/)
- [Nginx](https://nginx.org/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)

Required facts: None

Supported OS: Linux systems with `logrotate` and Podman.
