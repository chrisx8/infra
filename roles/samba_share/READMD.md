# Ansible Role: `samba_share`

This role installs and configures several application for file sharing, including:

- Cockpit
- Samba and SFTP

Notes:

- This role depends on the `cockpit` role.
- The Samba config will set up home directory shares for users.

Required facts: `distribution`

Supported OS: RedHat-based Linux systems, version 8 or newer
