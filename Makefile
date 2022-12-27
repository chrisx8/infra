CERTBOT_SCRIPT = files/certbot.sh
CERTBOT_WORKDIR = files/certbot.d
# Run pre-commit checks on all files
check:
	pre-commit run --all-files

# Set up Ansible environment
# Includes required Ansible collections and pre-commit hooks
envsetup:
	ansible-galaxy collection install --upgrade -r requirements.yml
	pre-commit install

## The following tasks run the certbot helper script
## Naming: certbot-(issue|renew)

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

setup-postgres:
	ansible-playbook setup.yml --limit postgres

setup-pihole:
	ansible-playbook setup.yml --limit pihole

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

upgrade-postgres:
	ansible-playbook upgrade.yml --limit postgres

upgrade-pihole:
	ansible-playbook upgrade.yml --limit pihole

upgrade-storage:
	ansible-playbook upgrade.yml --limit storage
