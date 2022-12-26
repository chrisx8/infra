# Ansible Role: `containers_storage`

This role provides role variables for `containers` role and installs containerized apps for the file server, including:

- [File Browser](https://github.com/filebrowser/filebrowser)
- [Jellyfin](https://jellyfin.org/)
  - [Ugrend/jellyfin-plugin-keycloak-auth](https://github.com/Ugrend/jellyfin-plugin-keycloak-auth)

Required facts: `distribution`, `virtualization_type`

Required role vars:

- `containers_storage_cron_ping_url`: Webhook URL for cron job.
- `storage_oidc`: OIDC client credentials, requires `client_id` and `client_secret`.

Supported OS: RHEL-like systems, version 8 or newer
