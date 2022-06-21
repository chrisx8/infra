# TinyNET Ansible Role: `app/firefly-iii`

This role installs [Firefly III](https://www.firefly-iii.org/) to `/var/www/firefly-iii`.

Notes:

- In the playbook, run `create_postgres_db.yml` tasks on a supported PostgreSQL before this role.
- The Apache configuration is provided by the `app/launcher` role.

Supported OS: Debian or Ubuntu with Apache web server 2.4.x and PHP 8.0
