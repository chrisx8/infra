# Ansible Role: `apache_php_fpm`

This role installs Apache Web Server 2.4.x, mod_auth_openidc. The role can also install PHP-fpm 8.1 and Composer (both optional).

Role vars:

- `php_install_composer` (optional):
  - If false (default): Composer will not be installed.
  - If true, the latest version of Composer will be installed. `php_repo` must be set.
- `php_repo` (optional):
  - If left blank (default), PHP will not be installed.
  - If set to `appstream`, PHP will be installed from AppStream.
  - If set to `remi`, PHP will be installed from [Remi's RPM repository](https://blog.remirepo.net/pages/Config-en).
  - Any other value is invalid.

Required facts: `distribution`

Supported OS: RHEL-like Linux, version 9
