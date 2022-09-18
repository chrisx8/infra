# TinyNET Ansible Role: `app/nextcloud`

This role installs the latest version of Nextcloud to `/var/www/nextcloud`.

Notes:

- In the playbook, run `create_postgres_db.yml` tasks on a supported PostgreSQL before this role.

Supported OS: RedHat-like OS with Apache httpd 2.4.x and PHP 8.0
