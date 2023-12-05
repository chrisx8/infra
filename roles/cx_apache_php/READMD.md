# Ansible Role: `cx_apache_php`

This role installs Apache Web Server and `mod_auth_openidc`. The role can also install php-fpm and Composer (both optional).

## Role variables

| Variable                         | Description                                                     | Required                |
| -------------------------------- | --------------------------------------------------------------- | ----------------------- |
| `cx_apache_php_install_composer` | Install the latest version of Composer. `php_repo` must be set. | No, default `false`     |
| `cx_apache_php_repo`             | Install PHP from `appstream` or `remi`[^1] repo.                | No, default `appstream` |
| `cx_apache_php_version`          | Version of PHP to install. If blank, PHP will not be installed. | No, default blank       |

[^1]: If set to `remi`, PHP will be installed from [Remi's RPM repository](https://blog.remirepo.net/pages/Config-en).

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

- RHEL 9, including its derivatives.
