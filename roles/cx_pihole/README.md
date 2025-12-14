# Ansible Role: `cx_pihole`

This role installs and configures Pi-hole.

## Role variables

| Variable                  | Description                                                 | Required            |
| ------------------------- | ----------------------------------------------------------- | ------------------- |
| `cx_pihole_config`        | Pi-hole config, will be placed at `/etc/pihole/pihole.toml` | **Yes**             |
| `cx_pihole_allow_selinux` | Whether to allow installation with SELinux Enforcing        | No, default `false` |

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

EL 8 or newer
