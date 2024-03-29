# chrisx8/infra

This repo is an Ansible monorepo for my self-hosted Linux environment. It contains what I'm using to manage my home servers and [software running on them](#software).

## Usage

### Setup

First, make sure you have **Python 3.12** and [**Pipenv**](https://pipenv.pypa.io) installed.

Then, install repo dependencies, including Ansible, Ansible collections, `ansible-lint`, and pre-commit hooks:

```bash
make envsetup
```

After initial setup, simply activate the Pipenv when working in this repo:

```bash
pipenv shell
```

### Makefile

You may run Ansible playbooks, and several repo-related tasks, with `make`.

Available `make` commands:

- `make *.yml`: run a given playbook against all hosts.
- `make */secrets.yml`: create/edit Ansible Vault.
- `make envsetup`: set up local Ansible environment, including Ansible collections and pre-commit.
- `make envupdate`: auto-update packages, pre-commit hooks, and requirements/lock files.
- `make pre-commit`: run pre-commit checks on all files.

Optional `make` args:

- `ANSIBLE_ARGS`: pass arbitrary arguments to Ansible, overwriting ALL args below.
- `check`: run Ansible with `--check`
  - Example: `make setup.yml check=yes`
- `debug`: run Ansible with `-vvv`
  - Example: `make setup.yml debug=yes`
- `diff`: run Ansible with `--diff`
  - Example: `make setup.yml diff=yes`
- `limit`: limit playbook run to specified host(s)
  - Example: `make setup.yml limit=guests`

## Dependencies

### Ansible Collections

Some Ansible roles here depend on additional Ansible collections. See [`requirements.yml`](requirements.yml) for details.

### Pre-commit hooks

Pre-commit hooks are configured. See [`.pre-commit-config.yaml`](.pre-commit-config.yaml) for details.

To update pre-commit hooks, run:

```bash
pre-commit autoupdate
```

## Software

- Apache HTTP Server with [mod_auth_openidc](https://github.com/OpenIDC/mod_auth_openidc)
- [Cockpit](https://cockpit-project.org/)
- [Gitea](https://gitea.io/)
- [Home Assistant](https://www.home-assistant.io)
  - [My Home Assistant Add-ons](https://github.com/chrisx8/hassio-addons)
  - [HACS](https://hacs.xyz)
- [Jellyfin](https://jellyfin.org/)
- [Miniflux](https://miniflux.app/)
- [OpenWrt](https://openwrt.org/)
- Samba and SFTP file shares
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)

## Resources

- [How to Home Lab](https://www.dlford.io/tag/how-to-home-lab-series/)
- [Postfix mail relay](https://www.howtoforge.com/tutorial/configure-postfix-to-use-gmail-as-a-mail-relay/)

## License

[GNU GPLv3](LICENSE)

Copyright (c) 2021-2023 Chris Xiao

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
