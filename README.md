# TinyNET Infrastructure Repo

A self-hosted virtualized Linux environment, deployed and managed with Ansible and Docker.

## Repo setup

### Tools used

- [Ansible](https://docs.ansible.com/ansible/latest/index.html)
- [Podman](https://podman.io/)

### Ansible Dependencies

Some Ansible roles here depend on additional Ansible collections, including:

- `ansible.posix`
- `community.postgresql`
- `containers.podman`

To install these, run:

```bash
ansible-galaxy collection install ansible.posix community.postgresql
```

### Pre-commit hooks

Pre-commit hooks are [configured](.pre-commit-config.yaml). To use them, you need to install [pre-commit](https://pre-commit.com/).

After installing pre-commit, set up Git hook scripts:

```bash
# install Git hook scripts
pre-commit install
# auto-update hooks
pre-commit autoupdate
```

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
- 5 Gigabit Ethernet ports (1 WAN, 4 LAN)
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
  - [My Home Assistant config](https://github.com/chrisx8/home-assistant-config)
  - [HACS](https://hacs.xyz)

### Identity Management & Single Sign-On

- [Keycloak](https://www.keycloak.org/)
- [mod_auth_openidc](https://github.com/zmartzone/mod_auth_openidc)

### Web Apps

- [Gitea](https://gitea.io/)
- [Jellyfin](https://jellyfin.org/)
- [LauncherTW](https://github.com/chrisx8/LauncherTW) (another one of my projects)
- [Minflux](https://miniflux.app/)
- [Nextcloud](https://nextcloud.com/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)

## Resources

- [How to Home Lab](https://www.dlford.io/tag/how-to-home-lab-series/)
- [Postfix mail relay](https://www.howtoforge.com/tutorial/configure-postfix-to-use-gmail-as-a-mail-relay/)
