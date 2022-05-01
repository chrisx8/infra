# TinyNET Infrastructure Repo

A self-hosted virtualized Linux environment, deployed and managed with Ansible and Docker.

## Tools used

- [Ansible](https://docs.ansible.com/ansible/latest/index.html)
- [Docker](https://docs.docker.com/engine/)
- [Docker Compose v2](https://docs.docker.com/compose/)

### Ansible Dependencies

Ansible roles here depend on `ansible.posix` and `community.postgresql` modules. To install these dependencies, run:

```bash
ansible-galaxy collection install ansible.posix community.postgresql
```

## Hardware

### Server: HP EliteDesk 800 G2 Mini

- Runs [Proxmox VE](https://www.proxmox.com/en/proxmox-ve)
- Intel Core i5-6500T, with Intel vPro
- 16GB DDR4 RAM (2 * 8GB)
- 240GB NVMe SSD + 1TB SATA HDD
- Intel I219-LM Onboard Gigabit Ethernet
- Intel Wireless-AC 8260 (dual-band 802.11ac Wi-Fi + Bluetooth 4.2)

### Wireless AP: NETGEAR R6220

- [OpenWrt wiki page](https://openwrt.org/toh/netgear/r6220)
- Runs [OpenWrt](https://openwrt.org)
- 5 Gigabit Ethernet ports (1 WAN, 4 LAN)
- 2x2 802.11ac Wi-Fi (300Mbps on 2.4GHz, 867Mbps on 5GHz)

## Software

### Networking

- [OpenWrt](https://openwrt.org/)
- [OPNsense](https://opnsense.org/)
- [Tailscale](https://tailscale.com/)
- [WireGuard](https://www.wireguard.com/)

### Storage & Backup

- Per-user file shares, accessible via Samba and SFTP
- [Proxmox Backup Server](https://pbs.proxmox.com/docs/)

### Home Automation

- [Home Assistant](https://www.home-assistant.io)
  - [My Home Assistant config repo](https://github.com/chrisx8/home-assistant-config)
  - [HACS](https://hacs.xyz)

### Identity Management & Single Sign-On

- [Keycloak](https://www.keycloak.org/)
- [mod_auth_openidc](https://github.com/zmartzone/mod_auth_openidc)

### Web Apps

- [Firefly III](https://www.firefly-iii.org/)
- [Gitea](https://gitea.io/)
- [Kanboard](https://kanboard.org/)
- [Minflux](https://miniflux.app/)
- [Nextcloud](https://nextcloud.com/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)
- [Wiki.js](https://js.wiki/)

## Resources

- [How to Home Lab](https://www.dlford.io/tag/how-to-home-lab-series/)
- [Postfix mail relay](https://www.howtoforge.com/tutorial/configure-postfix-to-use-gmail-as-a-mail-relay/)
- [Setting up WireGuard](https://linuxize.com/post/how-to-set-up-wireguard-vpn-on-ubuntu-20-04/)
