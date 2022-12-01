# Ansible Role: `app/containers`

This role installs Podman and containerized apps, including:

- [cloudflared](https://github.com/cloudflare/cloudflared)
- [Gitea](https://gitea.io/)
- [Keycloak](https://www.keycloak.org/)
- [Nginx](https://nginx.org/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)

Required facts: `distribution`, `virtualization_type`

Supported OS: RHEL-like systems, version 8 or newer
