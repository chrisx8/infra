# Ansible Role: `pihole`

This role installs Pi-hole.

Notes:

- Pi-hole on RHEL is not officially supported.
- This role will set up Apache with TLS and SSO, instead of Lighttpd.

Role variables:

- `pihole_oidc` (**required**): OIDC client credentials, requires `client_id` and `client_secret`.

Required facts: `distribution`

Supported OS: CentOS Stream 8 or newer
