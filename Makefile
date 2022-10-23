# Run pre-commit checks on all files
check:
	pre-commit run --all-files

# Set up Ansible environment
# Includes required Ansible collections and pre-commit hooks
envsetup:
	ansible-galaxy collection install ansible.posix community.postgresql containers.podman
	pre-commit install

# Update Ansible environment
# Auto-updates all pre-commit hooks
envupdate:
	pre-commit autoupdate

## The following tasks runs Ansible playbooks
## Naming: playbook-(all|group|host)
## Order in Makefile: all, groups, nodes

setup-all:
	ansible-playbook setup.yml

setup-guests:
	ansible-playbook setup.yml --limit guests

setup-proxmox:
	ansible-playbook setup.yml --limit proxmox

setup-container:
	ansible-playbook setup.yml --limit web-container

setup-php:
	ansible-playbook setup.yml --limit web-php

setup-pihole:
	ansible-playbook setup.yml --limit pihole

setup-postgres:
	ansible-playbook setup.yml --limit db-postgres

setup-storage:
	ansible-playbook setup.yml --limit storage

upgrade-all:
	ansible-playbook upgrade.yml

upgrade-guests:
	ansible-playbook upgrade.yml --limit guests

upgrade-proxmox:
	ansible-playbook upgrade.yml --limit proxmox

upgrade-container:
	ansible-playbook upgrade.yml --limit web-container

upgrade-php:
	ansible-playbook upgrade.yml --limit web-php

upgrade-postgres:
	ansible-playbook upgrade.yml --limit db-postgres

upgrade-storage:
	ansible-playbook upgrade.yml --limit storage
