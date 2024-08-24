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

## License

[GNU GPLv3](LICENSE)

Copyright (c) 2021-2024 Chris Xiao
