# Ansible Role: `php_fpm`

This role installs PHP-fpm 8.1 and Composer (optional). This role *requires* a web server to be installed, possibly using the `httpd` role.

Role vars:

- `php_install_composer` (optional): if defined and true, the latest version of Composer will be installed.
- `php_use_remi` (optional): if defined and true, PHP will be installed from [Remi's RPM repository](https://blog.remirepo.net/pages/Config-en). Otherwise, PHP will be installed from AppStream.

Required facts: `distribution`

Supported OS: RedHat-based Linux systems, version 9
