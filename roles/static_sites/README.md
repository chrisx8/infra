# Ansible Role: `static_sites`

This role installs [LauncherTW](https://github.com/chrisx8/LauncherTW), a homelab launcher powered by TailwindCSS and Ansible.

Required role vars:

- `golinks`: List of golinks. For each list element, include
  - `src`: Golink alias. For example, a value of `alias` refers to the URL `go/alias`.
  - `dst`: Full destination URL.
  - The golink endpoint redirects `go/src` to `dst`.
- `pages_oidc`: OIDC client credentials, requires `client_id` and `client_secret`.
- [LauncherTW role vars](https://github.com/chrisx8/LauncherTW#configuration)

Required facts: None

Supported OS: Linux systems with Apache 2.4.x and mod_auth_openidc.
