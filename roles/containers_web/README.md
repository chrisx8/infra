# Ansible Role: `containers_web`

This role provides role variables for `containers` role, and installs containerized web apps, including:

- [Apache HTTP Server with mod_auth_openidc](https://github.com/chrisx8/docker-apache-openidc)
- [cloudflared](https://github.com/cloudflare/cloudflared)
- [Gitea](https://gitea.io/)
- [Miniflux](https://miniflux.app/)
- [Keycloak](https://www.keycloak.org/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)

Role variables:

- `cloudflared_token` (**required**): Cloudflare Tunnel token.
- `containers_web_cron_ping_url` (**required**): Healthchecks.io ping URL for cron job.
- `golinks` (optional): List of golinks. For each list element, include
  - `src`: Golink alias. For example, a value of `alias` refers to the URL `go/alias`.
  - `dst`: Full destination URL.
  - Usage: `go/src` redirects to `dst`.
- `postgres_passwords`: list of PostgreSQL databases and users.
  - For each list element, specify `db_name: ""`.
  - This will create databases with `db_name` and users with username `db_name` and randonly generated passwords.
- `vaultwarden_env` (**required**): Vaultwarden environment variables. The following keys are required:
  - `PUSH_INSTALLATION_ID`
  - `PUSH_INSTALLATION_KEY`
  - `SMTP_FROM`
  - `SMTP_HOST`
  - `SMTP_PORT`
  - `SMTP_USERNAME`
  - `SMTP_PASSWORD`
  - `YUBICO_CLIENT_ID`
  - `YUBICO_SECRET_KEY`
  - Refer to [Vaultwarden .env.template](https://github.com/dani-garcia/vaultwarden/blob/main/.env.template).
- `vaultwarden_oidc` (**required**): OIDC client credentials, requires `client_id` and `client_secret`.

Required facts: `default_ipv4`, `distribution`, `virtualization_type`

Supported OS: RHEL-like systems, version 8 or newer
