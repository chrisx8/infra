# Ansible Role: `tailscale`

This role installs Tailscale.

Notes:

- This cannot run on LXC containers.
- You'll be prompted for setup.

Role variables:

- `tailscale_advertise_routes` (**required**): Comma-separated list of IP ranges (CIDR) to expose with Tailscale subnet router.

Required facts: `distribution`, `virtualization_type`

Supported OS: Debian or RedHat-based Linux system supported by Tailscale
