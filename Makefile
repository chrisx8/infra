ANSIBLE_VAULT_FLAGS = --vault-password-file files/bw_vault_password.sh
CERTBOT_SCRIPT = files/certbot.sh
CERTBOT_WORKDIR = files/certbot.d
EDITOR = code --wait

# Run pre-commit checks on all files
check:
	pre-commit run --all-files

# Set up Ansible environment
# Includes required Ansible collections and pre-commit hooks
envsetup:
	ansible-galaxy collection install -U -r requirements.yml
	pre-commit install

# Edit Ansible Vault
vaultedit:
	env EDITOR="$(EDITOR)" ansible-vault edit $(ANSIBLE_VAULT_FLAGS) vars/secrets.yml

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
	ansible-playbook setup.yml $(ANSIBLE_VAULT_FLAGS)

setup-guests:
	ansible-playbook setup.yml $(ANSIBLE_VAULT_FLAGS) --limit guests

setup-proxmox:
	ansible-playbook setup.yml $(ANSIBLE_VAULT_FLAGS) --limit proxmox

setup-containers:
	ansible-playbook setup.yml $(ANSIBLE_VAULT_FLAGS) --limit v-containers

setup-postgres:
	ansible-playbook setup.yml $(ANSIBLE_VAULT_FLAGS) --limit postgres

setup-pihole:
	ansible-playbook setup.yml $(ANSIBLE_VAULT_FLAGS) --limit pihole

setup-storage:
	ansible-playbook setup.yml $(ANSIBLE_VAULT_FLAGS) --limit storage

upgrade-all:
	ansible-playbook upgrade.yml $(ANSIBLE_VAULT_FLAGS)

upgrade-guests:
	ansible-playbook upgrade.yml $(ANSIBLE_VAULT_FLAGS) --limit guests

upgrade-proxmox:
	ansible-playbook upgrade.yml $(ANSIBLE_VAULT_FLAGS) --limit proxmox

upgrade-containers:
	ansible-playbook upgrade.yml $(ANSIBLE_VAULT_FLAGS) --limit v-containers

upgrade-postgres:
	ansible-playbook upgrade.yml $(ANSIBLE_VAULT_FLAGS) --limit postgres

upgrade-pihole:
	ansible-playbook upgrade.yml $(ANSIBLE_VAULT_FLAGS) --limit pihole

upgrade-storage:
	ansible-playbook upgrade.yml $(ANSIBLE_VAULT_FLAGS) --limit storage
