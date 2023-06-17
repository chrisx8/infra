# Ansible Role: `postgresql`

This role installs PostgreSQL 15.

Notes:

- Postgres will be configured to only accept secure (TLS) connections from external hosts.

Role variables:

- `postgres_cron_ping_url` (**required**): Healthchecks.io ping URL for cron job.

Required facts: `distribution`

Supported OS: Supported versions of RHEL-based OS.
