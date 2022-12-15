# Ansible Role: `containers_storage`

This role provides role variables for `containers` role and installs containerized apps for the file server, including:

- [File Browser](https://github.com/filebrowser/filebrowser)
- [Jellyfin](https://jellyfin.org/)
  - [Ugrend/jellyfin-plugin-keycloak-auth](https://github.com/Ugrend/jellyfin-plugin-keycloak-auth)

Required facts: `distribution`, `virtualization_type`

Supported OS: RHEL-like systems, version 8 or newer
