# chrisx8/infra

This repo is an Ansible monorepo for my self-hosted Linux environment.

## Usage

### Install dependencies

Install the following packages:

- Python **3.14**
- [**prek**](https://github.com/j178/prek)
- [**uv**](https://github.com/astral-sh/uv)

### Set up repo environment

Install repo dependencies, including Ansible, Ansible collections, `ansible-lint`, pre-commit hooks, and other Python packages:

```bash
source ./activate -u
```

After initial setup, simply activate the virtualenv when working in this repo:

```bash
source ./activate
```

### Update environment

Re-running the repo setup will update Python packages and Ansible collections:

```bash
source ./activate -u
```

Dependencies are declared in various places:

- Python dependencies are pinned by minor versions, declared in `requirements.txt`
  - Re-run setup after updating dependency pins
- Pre-commit hooks are pinned by exact versions, declared in `.pre-commit-config.yaml`
  - Update by running `prek autoupdate`
- Ansible collections are unpinned, declared in `requirements.yml`

## License

[GNU GPLv3](LICENSE)

Copyright (c) 2021-2024 Chris Xiao
