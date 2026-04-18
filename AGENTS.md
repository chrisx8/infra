# Ansible Infra Repository - Agent Guide

## Setup & Environment

- Activate environment: `source ./activate`
- Update dependencies: `source ./activate -u`
- Update pre-commit hooks: `prek autoupdate`

## Core Commands

**IMPORTANT: All commands in this guide assume the virtual environment is activated.**

- Run validation playbook: `ansible-playbook plays/validate.yml`
- Run linting: `prek run` (runs all pre-commit hooks)
- Run ansible-lint: `ansible-lint --offline -v`
- Run yamllint: `yamllint .`

## Important Notes

- Python 3.14 required (managed via uv)
- Pre-commit hooks include: yamllint, ansible-lint, shellcheck, and standard hooks
- Ansible collections managed via `requirements.yml`
- Validation playbook checks host configurations and inventory correctness
- Playbooks are organized in `plays/` directory for different deployment scenarios

## File Conventions

- Inventory files: `inventory/` directory
- Role definitions: `roles/` directory
- Playbooks: `plays/` directory
- Configuration: `.ansible-lint`, `.pre-commit-config.yaml`, `pyproject.toml`, `requirements.yml`
