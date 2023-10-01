# Ansible Role: `cx_container_pretasks`

This role provides pre-tasks for `cx_container_app`. See [`cx_container_app`](../cx_container_app/README.md) for more information.

## Role variables

| Variable                          | Description                                     | Required |
| --------------------------------- | ----------------------------------------------- | -------- |
| `_adguardhome_oidc_client_id`     | OIDC Client ID                                  | **Yes**  |
| `_adguardhome_oidc_client_secret` | OIDC Client Secret                              | **Yes**  |
| `_jellyfin_backup_ping_url`       | Healthchecks.io ping URL for nightly backup job | **Yes**  |
| `_vaultwarden_oidc_client_id`     | OIDC Client ID                                  | **Yes**  |
| `_vaultwarden_oidc_client_secret` | OIDC Client Secret                              | **Yes**  |
