#!/bin/bash
set -e
bw unlock --check 1>&2
bw sync 1>&2
bw get password "Infra Ansible Vault"
