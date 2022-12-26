# Ansible Role: `containers_web`

This role provides role variables for `containers` role and installs containerized web apps, including:

- [cloudflared](https://github.com/cloudflare/cloudflared)
- [Gitea](https://gitea.io/)
- [Keycloak](https://www.keycloak.org/)
- [Nginx](https://nginx.org/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)

Required facts: `distribution`, `virtualization_type`

Required role vars:

- `cloudflared_token`: Cloudflare Tunnel token.
- `containers_web_cron_ping_url`: Webhook URL for cron job.

Supported OS: RHEL-like systems, version 8 or newer
