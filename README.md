# TinyNET Infrastructure Repo

Core repo for TinyNET infrastructure config and docs.

## Hardware

### `gateway`

- NETGEAR R6220
- OS: OpenWrt
- CPU: MediaTek MT7621ST (ramips)
- RAM: 128MB (Onboard)
- Storage: 128MB Onboard NAND
- Networking: 5 * 1GbE + 2x2 dual-band 802.11 n/ac

### `tmmnode1`

- HP EliteDesk 800 G2 Mini
- Has Intel vPro
- OS: Proxmox VE
- CPU: Intel Core i5-6500T
- RAM: 8GB DDR4 (1 * 8GB SODIMM)
- Storage: 120GB SATA SSD
- Networking: 1GbE

## Services

### Networking

- [OpenWrt](https://openwrt.org/)
- [WireGuard](https://www.wireguard.com/)

### IAM

- [OAuth2 Proxy](https://oauth2-proxy.github.io/oauth2-proxy/)

### Storage

- [Nextcloud](https://nextcloud.com/)
- OpenSSH / SFTP

### Web Apps

- [BookStack](https://www.bookstackapp.com/)
- [FreshRSS](https://freshrss.org/)

## Resources

- [How to Home Lab](https://www.dlford.io/tag/how-to-home-lab-series/)
- [Setting up WireGuard](https://linuxize.com/post/how-to-set-up-wireguard-vpn-on-ubuntu-20-04/)
