# AGENTS.md

## Setup

Always activate the virtual env before running any Ansible or lint commands:

```bash
source ./activate        # activate existing virtual env
source ./activate -u     # bootstrap or update (Python pkgs, Ansible collections, pre-commit hooks, clones inventory repo)
```

`inventory/` is a separate repo (`chrisx8/infra-inventory`), cloned by `activate` and `.gitignore`d here. Inventory changes go there.

## Lint and validate

Pre-commit hooks managed by **prek** (not `pre-commit`):

```bash
prek run --all-files           # run all hooks
prek autoupdate                # update hook versions
yamllint <file>                # single yamllint check
ansible-lint --offline -v      # single ansible-lint check
ansible-playbook plays/validate.yml  # single validation
```

Hooks run: yamllint → ansible-lint (`--offline -v`, production profile) → `plays/validate.yml`. CI runs `prek run --all-files` with `SKIP=validate`.

## Ansible conventions

- `gathering = explicit`: declare `gather_facts: true` and `gather_subset` explicitly
- `inject_facts_as_vars = false`: use `{{ ansible_facts['...'] }}`, never auto-injected vars like `ansible_os_distribution`
- Manage collections with `ansible-galaxy`, declare in `requirements.yml`
- Roles in `roles/`, all named `cx_*`; each role has a `README.md` — read it before modifying the role
- Python 3.14, `uv` for dependency management

## Playbooks

| Playbook                | Purpose                                              |
| ----------------------- | ---------------------------------------------------- |
| `deploy_host_os.yml`    | Base OS config for EL and Proxmox hosts              |
| `deploy_host_role.yml`  | Host-level services (k3s, Podman, Pi-hole, PG, TS)   |
| `deploy_app.yml`        | Deploy apps (container + k8s with optional PG DB)    |
| `decom_app.yml`         | Remove apps (`state: absent`)                        |
| `upgrade_host_os.yml`   | OS package upgrades                                  |
| `validate.yml`          | Inventory validation (pre-commit hook)               |

## App architecture

- **Container apps** (`cx_container_app`): hostnames end in `.container`, Podman-based on `cx_container_runtime` hosts
- **K8s apps** (`cx_k8s_app`): hostname format `appname.namespace.k8s`, namespace derived from hostname, deployed via Helm/manifests/resources, delegated to `localhost` (kubeconfig, no SSH). Optional PostgreSQL: set `cx_postgresql_db_name` in `host_vars`; `deploy_app.yml` creates it via `cx_postgresql_db_host`

## Lint rules

- yamllint: 120 char line limit, `comments-indentation: false`, document-start (`---`), double quotes only, no octal
- ansible-lint: **production** profile; extra rules: `args`, `empty-string-compare`, `no-same-owner`
