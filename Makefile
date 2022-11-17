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

## The following tasks run the certbot helper script
## Naming: certbot-(issue|renew)
CERTBOT_SCRIPT=files/certbot.sh
CERTBOT_WORKDIR=files/certbot.d

certbot-issue:
	$(CERTBOT_SCRIPT) $(CERTBOT_WORKDIR) issue

certbot-renew:
	$(CERTBOT_SCRIPT) $(CERTBOT_WORKDIR) renew

## The following tasks run Ansible playbooks
## Naming: playbook-(all|group|host)
## Order in Makefile: all, groups, nodes

setup-all:
	ansible-playbook setup.yml

setup-guests:
	ansible-playbook setup.yml --limit guests

setup-proxmox:
	ansible-playbook setup.yml --limit proxmox

setup-containers:
	ansible-playbook setup.yml --limit v-containers

setup-lapp:
	ansible-playbook setup.yml --limit c-lapp

setup-pihole:
	ansible-playbook setup.yml --limit c-pihole

setup-storage:
	ansible-playbook setup.yml --limit storage

upgrade-all:
	ansible-playbook upgrade.yml

upgrade-guests:
	ansible-playbook upgrade.yml --limit guests

upgrade-proxmox:
	ansible-playbook upgrade.yml --limit proxmox

upgrade-containers:
	ansible-playbook upgrade.yml --limit v-containers

upgrade-lapp:
	ansible-playbook upgrade.yml --limit c-lapp

upgrade-storage:
	ansible-playbook upgrade.yml --limit storage
