# chrisx8/infra

This repo is an Ansible monorepo for my self-hosted Linux environment.

## Usage

### Setup

First, make sure you have **Python 3.12** and [**uv**](https://github.com/astral-sh/uv) installed.

Then, install repo dependencies, including Ansible, Ansible collections, `ansible-lint`, pre-commit hooks, and other Python packages:

```bash
./utils/envsetup.sh
```

After initial setup, simply activate the virtualenv when working in this repo:

```bash
source ./activate
```

### Shell functions

Once you activate the virtualenv with `./activate`, some shell aliases will be available.

Available shell aliases:

- `anplay`: run `ansible-playbook`
- `anvault`: run `ansible-vault`
- `chkall`: run pre-commit checks on all files

### Update environment

With the virtualenv activated, run the update script, which will update Python packages, Ansible collections, and pre-commit hooks:

```bash
./utils/envupdate.sh
```

## Dependencies

### Ansible Collections

Some Ansible roles here depend on additional Ansible collections. See [`requirements.yml`](requirements.yml) for details.

### Pre-commit hooks

Pre-commit hooks are configured. See [`.pre-commit-config.yaml`](.pre-commit-config.yaml) for details.

To update pre-commit hooks, run:

```bash
pre-commit autoupdate
```

## License

[GNU GPLv3](LICENSE)

Copyright (c) 2021-2023 Chris Xiao

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
