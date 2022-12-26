# Ansible Role: `static_sites`

This role installs [LauncherTW](https://github.com/chrisx8/LauncherTW), a homelab launcher powered by TailwindCSS and Ansible.

Required role vars:

- `pages_oidc`: OIDC client credentials, requires `client_id` and `client_secret`.

Required facts: None

Supported OS: Linux systems with Apache 2.4.x and mod_auth_openidc.
