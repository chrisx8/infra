# Ansible Role: `cx_tailscale`

This role installs and configures Tailscale.

## Role variables

| Variable                         | Description                                                    | Required |
| -------------------------------- | -------------------------------------------------------------- | -------- |
| `cx_tailscale_args`              | List of arguments to pass to Tailscale                         | No       |
| `cx_tailscale_auth_key`          | Tailscale auth key. Must authenticate manually if unset        | No       |
| `cx_tailscale_relay_server_port` | UDP port for Peer Relay. Leaving undefined disables peer relay | No       |

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

- EL 8 or newer
- Tailscale 1.86 or newer for Peer Relay
