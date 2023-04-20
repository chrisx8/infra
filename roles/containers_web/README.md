# Ansible Role: `containers_web`

This role provides role variables for `containers` role, and installs containerized web apps, including:

- [Apache HTTP Server with mod_auth_openidc](https://github.com/chrisx8/docker-apache-openidc)
- [cloudflared](https://github.com/cloudflare/cloudflared)
- [Gitea](https://gitea.io/)
- [LauncherTW](https://github.com/chrisx8/LauncherTW)
- [Keycloak](https://www.keycloak.org/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)

Role variables:

- `cloudflared_token` (**required**): Cloudflare Tunnel token.
- `containers_web_cron_ping_url` (**required**): Webhook URL for cron job.
- `golinks` (optional): List of golinks. For each list element, include
  - `src`: Golink alias. For example, a value of `alias` refers to the URL `go/alias`.
  - `dst`: Full destination URL.
  - Usage: `go/src` redirects to `dst`.
- `pages_oidc` (**required**): OIDC client credentials, requires `client_id` and `client_secret`.
- `postgres_passwords`: list of PostgreSQL databases and users. For each list element, specify `db_name: ""`
  - This will create databases with `db_name` and users with username `db_name` and randonly generated passwords.
- `vaultwarden_oidc` (**required**): OIDC client credentials, requires `client_id` and `client_secret`.
- [LauncherTW role vars](https://github.com/chrisx8/LauncherTW#configuration) (**required**)

Required facts: `distribution`, `virtualization_type`

Supported OS: RHEL-like systems, version 8 or newer
