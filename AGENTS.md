# chrisx8/infra - agent guide

## Setup

Always activate the virtual env before running any Ansible or lint commands:

```bash
source ./activate        # activate existing virtual env
source ./activate -u     # bootstrap or update (Python pkgs, Ansible collections, pre-commit hooks, clones/pulls inventory repo)
```

`activate` also exports `ANSIBLE_CONFIG` pointing at this repo's `ansible.cfg`.

`inventory/` is a separate `.gitignore`d repo (`chrisx8/infra-inventory`). Inventory changes go there.

## Lint and validate

Pre-commit hooks managed by **prek** (not `pre-commit`):

```bash
prek run --all-files           # run all hooks
prek autoupdate                # update hook versions
yamllint <file>                # single yamllint check
ansible-lint --offline -v      # single ansible-lint check
ansible-playbook plays/validate.yml  # single validation
```

Hook order: generic hygiene (shellcheck, forbid-binary, etc.) -> yamllint -> ansible-lint -> `plays/validate.yml`.

## Ansible conventions

- `gathering = explicit`: plays needing facts declare `gather_facts: true` and explicit `gather_subset`; otherwise omit `gather_facts`
- `inject_facts_as_vars = false`: use `{{ ansible_facts['...'] }}`, never auto-injected vars like `ansible_os_distribution`
- Collections via `ansible-galaxy`, declared in `requirements.yml`
- Roles in `roles/`, all named `cx_*`. Read a role's `README.md` before modifying it; keep its tables (variables,
  required facts, system requirements) in sync with changes, and "Required facts" in sync with the `gather_subset`
  of the playbooks that call the role
- Python 3.14, `uv` for dependencies (`exclude-newer = "P3D"` in `pyproject.toml`)

## Playbooks

- `deploy_host_os.yml` - base OS config for EL and Proxmox hosts
- `deploy_host_role.yml` - host-level services (k3s, Podman, Pi-hole, PostgreSQL, Tailscale, etc.)
- `deploy_app.yml` / `decom_app.yml` - deploy / remove container/K8s apps
- `upgrade_host_os.yml` - OS package upgrades
- `validate.yml` - inventory validation (pre-commit hook)

## App architecture

- **Container apps** (`cx_container_app`): hostnames end in `.container`; Podman-based on `cx_container_runtime` hosts
- **K8s apps** (`cx_k8s_app`): hostname format `appname.namespace.k8s`, namespace derived from hostname; deployed via
  Helm/manifests/resources, delegated to `localhost` (kubeconfig, no SSH). Optional PostgreSQL: set
  `cx_postgresql_db_name` in `host_vars`; `deploy_app.yml` creates it via `cx_postgresql_db_host`
- **Cluster-scoped k8s apps** (`cx_k8s_app_cluster`): hostname format `appname.k8s`, declare `cx_k8s_app_k8s_namespace` explicitly

## Inventory groups

Defined in the inventory repo but group names are hard-coded in playbooks here:

- `hosts_el` / `hosts_pve` - base OS groups (Enterprise Linux, Proxmox VE)
- `cx_<role>` - one group per host role (`cx_admin_node`, `cx_container_runtime`, `cx_pihole`, `cx_postgresql`, `cx_tailscale`)
- `cx_k3s_node_servers` / `cx_k3s_node_agents` - k3s controllers / workers
- `cx_container_app`, `cx_k8s_app`, `cx_k8s_app_cluster` - app groups
- `cx_k8s_app_<namespace>` - k8s apps grouped by namespace, dashes replaced with underscores (asserted by `validate.yml`)

## Lint rules

- yamllint: 120-char lines, document-start (`---`), quote only when needed (double quotes), no octal, `comments-indentation: false`
- ansible-lint: **production** profile; extra rules: `args`, `empty-string-compare`, `no-same-owner`
