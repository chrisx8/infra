# Ansible Role: `cx_postgresql`

This role installs PostgreSQL server.

Note: PostgreSQL will be configured to only accept connections from the local network.

## Role variables

| Variable                      | Description                                                  | Required                   |
| ----------------------------- | ------------------------------------------------------------ | -------------------------- |
| `cx_postgresql_allow_hosts`   | List of addresses (CIDR notation) that may access PostgreSQL | No, default `127.0.0.1/32` |
| `cx_postgresql_cron_ping_url` | Healthchecks.io ping URL for backup cron job                 | No                         |
| `cx_postgresql_version`       | PostgreSQL version to install, minimum `11`                  | No, default `16`           |

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

- RHEL systems (including their derivatives) supported by PostgreSQL.
