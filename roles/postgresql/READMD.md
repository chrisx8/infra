# Ansible Role: `postgresql`

This role installs PostgreSQL 14.

Notes:

- Postgres will be configured to only accept secure (TLS) connections from external hosts.

Role variables:

- `postgres_cron_ping_url` (**required**): Webhook URL for cron job.

Required facts: `distribution`

Supported OS: Supported versions of RHEL-based OS.
