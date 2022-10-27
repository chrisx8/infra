# TinyNET Infrastructure Repo

[![pre-commit checks](https://github.com/chrisx8/tinynet-infra/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/chrisx8/tinynet-infra/actions/workflows/pre-commit.yml)

A self-hosted virtualized Linux environment, deployed and managed with Ansible and Docker.

## Tools used

- [Ansible](https://docs.ansible.com/ansible/latest/index.html)
- [Podman](https://podman.io/)

## Setup

### Install dependencies

First, make sure you have [Ansible](https://docs.ansible.com/ansible/latest/index.html), `ansible-lint`, and [pre-commit](https://pre-commit.com/) installed.

Then, install repo dependencies, including Ansible collections and pre-commit hooks:

```bash
make envsetup
```

### Ansible Collections

Some Ansible roles here depend on additional Ansible collections, including:

- `ansible.posix`
- `community.postgresql`
- `containers.podman`

### Pre-commit hooks

Pre-commit hooks are [configured](.pre-commit-config.yaml).

After installing pre-commit, set up Git hook scripts:

```bash
# install Git hook scripts
pre-commit install
```

To update pre-commit hooks, run:

```bash
# use makefile
make envupdate
# or, update manually
pre-commit autoupdate
```

## Makefile

You may run Ansible playbooks, and several repo-related tasks, with `make`.

Some `make` commands:

- `make check`: run pre-commit checks on all files.
- `make envsetup`: set up local Ansible environment, including Ansible collections and pre-commit.
- `make setup-all`: run `setup.yml` playbook against all hosts.
- `make upgrade-all`: run `upgrade.yml` playbook against all hosts.
- There are more `make` commands. To learn more, see [Makefile](Makefile).

## Hardware

### Server: HP EliteDesk 800 G2 Mini

- Runs [Proxmox VE](https://www.proxmox.com/en/proxmox-ve)
- Intel Core i5-6500T (quad-core)
- 16GB DDR4 RAM (2 * 8GB)
- 240GB NVMe SSD + 8TB SATA HDD
- Intel I219-LM Onboard Gigabit Ethernet
- Intel Wireless-AC 8260 (dual-band 802.11ac Wi-Fi + Bluetooth 4.2)

### Router & Wi-Fi AP: Belkin RT3200

- Runs [OpenWrt](https://openwrt.org)
  - [OpenWrt installer](https://github.com/dangowrt/owrt-ubi-installer)
- [OpenWrt wiki page](https://openwrt.org/toh/linksys/e8450)
  - FYI: Belkin RT3200 == Linksys E8450
- Wi-Fi 6 (802.11ax) radio (3200Mbps, 4x4)

## Software

### Networking

- [OpenWrt](https://openwrt.org/)
- [Pi-hole](https://pi-hole.net/)
- [Tailscale](https://tailscale.com/)

### Storage & Backup

- Per-user file shares, accessible via Samba and SFTP
- [Proxmox Backup Server](https://pbs.proxmox.com/docs/)

### Home Automation

- [Home Assistant](https://www.home-assistant.io)
  - [My Home Assistant Add-ons](https://github.com/chrisx8/home-assistant-addons)
  - [HACS](https://hacs.xyz)

### Identity Management & Single Sign-On

- [Keycloak](https://www.keycloak.org/)
- [mod_auth_openidc](https://github.com/zmartzone/mod_auth_openidc)

### Web Apps

- [Gitea](https://gitea.io/)
- [Jellyfin](https://jellyfin.org/)
  - [Ugrend/jellyfin-plugin-keycloak-auth](https://github.com/Ugrend/jellyfin-plugin-keycloak-auth)
- [LauncherTW](https://github.com/chrisx8/LauncherTW) (another one of my projects)
- [Nextcloud](https://nextcloud.com/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)

## Resources

- [How to Home Lab](https://www.dlford.io/tag/how-to-home-lab-series/)
- [Postfix mail relay](https://www.howtoforge.com/tutorial/configure-postfix-to-use-gmail-as-a-mail-relay/)
