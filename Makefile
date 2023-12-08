ANSIBLE_VAULT_ARGS ?= --vault-password-file utils/vault_password_op.sh

# Set variable `ANSIBLE_ARGS` to pass arbitrary arguments to Ansible,
# overwriting all other Ansible-related args.

# Set variable `check` to run Ansible with `--check`
# Example: `make setup.yml check=yes`
ifdef check
	ANSIBLE_ARGS += --check
endif

# Set variable `diff` to run Ansible with `--diff`
# Example: `make setup.yml diff=yes`
ifdef diff
	ANSIBLE_ARGS += --diff
endif

# Set variable `limit` to limit run to specified host(s)
# Example: `make setup.yml limit=guests`
ifdef limit
	ANSIBLE_ARGS += --limit "$(limit)"
endif

# hack: placeholder task
_:

# Run any Ansible playbook
%.yml: _
	pipenv run ansible-playbook $(ANSIBLE_VAULT_ARGS) $(ANSIBLE_ARGS) $@

# Create or edit Ansible Vault.
%/secrets.yml: _
	pipenv run ansible-vault edit $(ANSIBLE_VAULT_ARGS) "$@" || pipenv run ansible-vault create $(ANSIBLE_VAULT_ARGS) "$@"

# Set up Ansible environment
# Includes required Ansible collections and pre-commit hooks
envsetup:
	pipenv install --dev
	@echo
	pipenv run ansible-galaxy collection install -U -r requirements.yml
	@echo
	pipenv run pre-commit install --install-hooks

# Auto-update Ansible environment packages, pre-commit hooks, and requirements/lock files
envupdate:
	pipenv update --dev
	@echo
	pipenv run ansible-galaxy collection install -U -r requirements.yml
	@echo
	pipenv run pre-commit autoupdate

# Run pre-commit checks on all files
pre-commit:
	pipenv run pre-commit run --all-files
