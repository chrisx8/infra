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

### Inventory

Ansible inventory lives in a separate repo, [chrisx8/infra-inventory](https://github.com/chrisx8/infra-inventory).
`source ./activate -u` clones it into `inventory/` on first run, and pulls it on subsequent runs. The `inventory/`
directory is `.gitignore`d in this repo.

### Run playbooks

Activate the virtualenv first, then run a playbook from `plays/`:

```bash
ansible-playbook plays/<playbook>.yml
```

| Playbook               | Purpose                                                                      |
| ---------------------- | ---------------------------------------------------------------------------- |
| `deploy_host_os.yml`   | Base OS config for EL and Proxmox VE hosts                                   |
| `deploy_host_role.yml` | Host-level services, such as k3s, Podman, Pi-hole, PostgreSQL, and Tailscale |
| `deploy_app.yml`       | Deploy container and k8s apps, with optional PostgreSQL database             |
| `decom_app.yml`        | Remove container and k8s apps                                                |
| `upgrade_host_os.yml`  | OS package upgrades                                                          |
| `validate.yml`         | Inventory validation (also runs as a pre-commit hook)                        |

### Lint

Run all pre-commit hooks (hygiene checks, `yamllint`, `ansible-lint`, and inventory validation):

```bash
prek run --all-files
```

## Dependencies

Dependencies are declared in various places:

- Python dependencies are pinned by minor versions, declared in `pyproject.toml`
  - Re-run setup after updating dependency pins
- Pre-commit hooks are pinned by exact versions, declared in `.pre-commit-config.yaml`
  - Update by running `prek autoupdate`
- Ansible collections are unpinned, declared in `requirements.yml`

## License

[GNU GPLv3](LICENSE)

Copyright (c) 2021-2026 Chris Xiao
