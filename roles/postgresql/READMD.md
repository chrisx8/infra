# Ansible Role: `postgresql`

This role installs PostgreSQL 14.

Notes:

- Postgres will be configured to only accept secure (TLS) connections from external hosts.

Required facts: `distribution`

Required role vars:

- `postgres_cron_ping_url`: Webhook URL for cron job.

Supported OS: Supported versions of RHEL-based OS.
