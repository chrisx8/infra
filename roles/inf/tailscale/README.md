# TinyNET Ansible Role: `inf/tailscale`

This role installs Tailscale.

Notes:

- This cannot run on LXC containers.
- You'll be prompted for setup.

Required facts: `distribution`, `virtualization_type`

Supported OS: Debian or RedHat-based Linux system supported by Tailscale
