# chrisx8/infra

This repo is an Ansible monorepo for my self-hosted Linux environment. It contains what I'm using to manage [my home servers](#hardware) and [software running on them](#software).

I use [Ansible](https://docs.ansible.com/ansible/latest/index.html) and [Podman](https://podman.io/) extensively to manage my systems.

## Usage

### Setup

First, make sure you have [Ansible](https://docs.ansible.com/ansible/latest/index.html), `ansible-lint`, and [pre-commit](https://pre-commit.com/) installed.

Then, install repo dependencies, including Ansible collections and pre-commit hooks:

```bash
make envsetup
```

### Makefile

You may run Ansible playbooks, and several repo-related tasks, with `make`.

Available `make` commands:

- `make *.yml`: run a given playbook against all hosts.
- `make certbot-*`: run the [certbot helper script](files/certbot.sh).
- `make envsetup`: set up local Ansible environment, including Ansible collections and pre-commit.
- `make pre-commit`: run pre-commit checks on all files.
- `make vaultedit`: edit Ansible Vault.

Optional `make` args:

- `checkdiff`: run Ansible with `--check --diff`
  - Example: `make setup checkdiff=yes`
- `limit`: limit playbook run to specified host(s)
  - Example: `make setup limit=guests`

## Dependencies

### Ansible Collections

Some Ansible roles here depend on additional Ansible collections. See [`requirements.yml`](requirements.yml) for details.

### Pre-commit hooks

Pre-commit hooks are configured. See [`.pre-commit-config.yaml`](.pre-commit-config.yaml) for details.

To update pre-commit hooks, run:

```bash
pre-commit autoupdate
```

## Hardware

### Server: HP EliteDesk 800 G2 Mini

- Runs [Proxmox VE](https://www.proxmox.com/en/proxmox-ve)
- Intel Core i5-6500T (quad-core)
- 16GB DDR4 RAM
- 240GB NVMe SSD + 8TB SATA HDD
- Intel Gigabit Ethernet
- Intel Wireless-AC 9260 (802.11ac Wi-Fi + Bluetooth 5.1)

### Router & Wi-Fi AP: Belkin RT3200

- Wi-Fi 6 (AX3200)
- Runs [OpenWrt](https://openwrt.org)
  - [OpenWrt installer](https://github.com/dangowrt/owrt-ubi-installer)
- [OpenWrt wiki page](https://openwrt.org/toh/linksys/e8450)
  - Note: Belkin RT3200 == Linksys E8450

## Software

### Networking

- [OpenWrt](https://openwrt.org/)
- [Pi-hole](https://pi-hole.net/)
- [Tailscale](https://tailscale.com/)

### Home Automation

- [Home Assistant](https://www.home-assistant.io)
  - [My Home Assistant Add-ons](https://github.com/chrisx8/home-assistant-addons)
  - [HACS](https://hacs.xyz)

### Identity Management & Single Sign-On

- [Keycloak](https://www.keycloak.org/)
- [mod_auth_openidc](https://github.com/zmartzone/mod_auth_openidc)

### Storage and Media

- [File Browser](https://github.com/filebrowser/filebrowser)
- [Jellyfin](https://jellyfin.org/)
  - [Ugrend/jellyfin-plugin-keycloak-auth](https://github.com/Ugrend/jellyfin-plugin-keycloak-auth)
- Per-user file shares, accessible via Samba and SFTP

### Web Apps

- [Gitea](https://gitea.io/)
- [LauncherTW](https://github.com/chrisx8/LauncherTW) (another one of my projects)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)

## Resources

- [How to Home Lab](https://www.dlford.io/tag/how-to-home-lab-series/)
- [Postfix mail relay](https://www.howtoforge.com/tutorial/configure-postfix-to-use-gmail-as-a-mail-relay/)

## License

[GNU GPLv3](LICENSE)

Copyright (c) 2021-2023 Chris Xiao

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
