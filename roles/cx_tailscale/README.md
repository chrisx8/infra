# Ansible Role: `cx_tailscale`

This role installs Tailscale.

## Role variables

| Variable                | Description                    | Required |
| ----------------------- | ------------------------------ | -------- |
| `cx_tailscale_args`     | Arguments to pass to Tailscale | No       |
| `cx_tailscale_auth_key` | Tailscale auth key             | **Yes**  |

## Required facts

| Fact                  | Purpose                      |
| --------------------- | ---------------------------- |
| `distribution`        | Checking system requirements |
| `virtualization_type` | Checking system requirements |

## System requirements

- Debian or RHEL (including their derivatives) systems supported by Tailscale.
- LXC containers are not supported.
