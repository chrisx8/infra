# Ansible Role: `tailscale`

This role installs Tailscale.

Notes:

- This cannot run on LXC containers.
- You'll be prompted for setup.

Role variables:

- `tailscale_args` (optional, default is blank): Arguments to pass to Tailscale.
  - For example, if you want to use a host as an "exit node", set `--advertise-exit-node`.

Required facts: `distribution`, `virtualization_type`

Supported OS: Debian or RedHat-based Linux system supported by Tailscale
