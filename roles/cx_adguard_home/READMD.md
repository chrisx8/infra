# Ansible Role: `cx_adguard_home`

This role installs [AdGuard Home](https://github.com/AdguardTeam/AdGuardHome) and configures it to run as a rootless user.

## Role variables

| Variable                    | Description                                            | Required |
| --------------------------- | ------------------------------------------------------ | -------- |
| `cx_adguard_home_cert_name` | Common Name (CN) of SSL certificate managed by Certbot | **Yes**  |

## Required facts

None

## System requirements

- Any modern Linux with systemd
