#!/bin/bash
set -e

bw sync 1>&2
bw unlock --check 1>&2 || true
bw get password "Infra Ansible Vault"