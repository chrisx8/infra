# Ansible Role: `inf/apache_php`

This role installs Apache Web Server 2.4.x, PHP 8.1, and optionally, Composer.

Role vars:

- `php_enable`: if defined and true, install PHP.
- `php_use_composer`: if defined and true, the latest version of Composer will be installed.
- `php_use_remi`: if defined and true, PHP will be installed from [Remi's RPM repository](https://blog.remirepo.net/pages/Config-en). Otherwise, PHP will be installed from AppStream.

Required facts: None

Supported OS: RedHat-based Linux systems, version 9
