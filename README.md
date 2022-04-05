# TinyNET Infrastructure Repo

Core repo for TinyNET infrastructure config and docs.

## Ansible Dependencies

Ansible playbooks here depend on `ansible.posix` and `community.mysql` modules. To install these dependencies, run:

```bash
ansible-galaxy collection install ansible.posix community.mysql
```

## Hardware

### Gateway

- NETGEAR R6220
- OS: OpenWrt
- CPU: MediaTek MT7621ST (ramips)
- RAM: 128MB (Onboard)
- Storage: 128MB Onboard NAND
- Networking: 5 * GbE + 2x2 dual-band 802.11 n/ac

### Krista

- HP EliteDesk 800 G2 Mini
- OS: Proxmox VE (includes [Proxmox Backup Server](https://pbs.proxmox.com/docs/))
- CPU: Intel Core i5-6500T (AMT/vPro)
- RAM: 8GB DDR4 (1 * 8GB SODIMM)
- Storage: 240GB NVMe SSD
- Networking: 1 * GbE

## Services

### Networking

- [OpenWrt](https://openwrt.org/)
- [NGINX](https://nginx.org)
- [Tailscale](https://tailscale.com/)
- [WireGuard](https://www.wireguard.com/)

### Home Automation

- [Home Assistant](https://www.home-assistant.io)

### IAM

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

### Storage

- OpenSSH / SFTP
- SAMBA
- [Proxmox Backup Server](https://pbs.proxmox.com/docs/)

## Resources

- [How to Home Lab](https://www.dlford.io/tag/how-to-home-lab-series/)
- [Postfix mail relay](https://www.howtoforge.com/tutorial/configure-postfix-to-use-gmail-as-a-mail-relay/)
- [Setting up WireGuard](https://linuxize.com/post/how-to-set-up-wireguard-vpn-on-ubuntu-20-04/)
- [Using Samba for Time Machine](https://adamdemasi.com/2018/03/24/using-samba-as-a-time-machine-network-server.html)
