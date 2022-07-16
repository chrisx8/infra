# TinyNET Ansible Role: `app/pihole`

This role installs Pi-hole.

Notes:

- This role will set up Apache with TLS and SSO, instead of Lighttpd.
- Pi-hole on RHEL is not officially supported.
- In order to perform a non-interactive install, there is a hacky wrapper script
  for the official Pi-hole install script.

Supported OS: RedHat-based Linux systems
