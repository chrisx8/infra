# TinyNET Infrastructure Repo

Core repo for TinyNET infrastructure config and docs.

## Hardware

### Gateway

- NETGEAR R6220
- OS: OpenWrt
- CPU: MediaTek MT7621ST (ramips)
- RAM: 128MB (Onboard)
- Storage: 128MB Onboard NAND
- Networking: 5 * 1GbE + 2x2 dual-band 802.11 n/ac

### Krista

- HP EliteDesk 800 G2 Mini
- Intel AMT/vPro
- OS: Proxmox VE  
  Install kernel 5.11: `apt install pve-kernel-5.11`  
  Install extra packages: `apt install vim lm-sensors cryptsetup-bin ntfs-3g udisks2 --no-install-recommends`
  Includes [Proxmox Backup Server](https://pbs.proxmox.com/docs/installation.html#install-proxmox-backup-server-on-proxmox-ve)
- CPU: Intel Core i5-6500T
- RAM: 8GB DDR4 (1 * 8GB SODIMM)
- Storage: 240GB NVMe SSD
- Networking: 1GbE

## Services

### Networking / Ingress

- [OpenWrt](https://openwrt.org/)
- [NGINX](https://nginx.org)
- [WireGuard](https://www.wireguard.com/)

### IAM

- [Keycloak](https://www.keycloak.org/)
- [mod_auth_openidc](https://github.com/zmartzone/mod_auth_openidc)

### Web Apps

- [BookStack](https://www.bookstackapp.com/)
- [Minflux](https://miniflux.app/)
- [Nextcloud](https://nextcloud.com/)
- [Wallabag](https://wallabag.org)

### Storage

- OpenSSH / SFTP

## Resources

- [How to Home Lab](https://www.dlford.io/tag/how-to-home-lab-series/)
- [Setting up WireGuard](https://linuxize.com/post/how-to-set-up-wireguard-vpn-on-ubuntu-20-04/)
