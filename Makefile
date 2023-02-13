ANSIBLE_VAULT_ARGS = --vault-password-file files/bw_vault_password.sh
EDITOR = code --wait

# Set variable `checkdiff` to run Ansible with `--check --diff`
# Example: `make setup.yml checkdiff=yes`
ifdef checkdiff
	ANSIBLE_ARGS += --check --diff
endif

# Set variable `limit` to limit run to specified host(s)
# Example: `make setup.yml limit=guests`
ifdef limit
	ANSIBLE_ARGS += --limit "$(limit)"
endif

# Set variable `novault` to bypass Ansible Vault setup
# Example: `make setup.yml novault=yes`
ifdef novault
	ANSIBLE_VAULT_ARGS =
endif

# hack: placeholder task
_:

# Run any Ansible playbook
%.yml: _
	ansible-playbook $(ANSIBLE_VAULT_ARGS) $(ANSIBLE_ARGS) $@

## Run the certbot helper script
certbot-%: _
	files/certbot.sh files/certbot.d $@

# Set up Ansible environment
# Includes required Ansible collections and pre-commit hooks
envsetup:
	ansible-galaxy collection install -U -r requirements.yml
	pre-commit install --install-hooks

# Run pre-commit checks on all files
pre-commit:
	pre-commit run --all-files

# Edit Ansible Vault
vaultedit:
	ansible-vault edit $(ANSIBLE_VAULT_ARGS) vars/secrets.yml
