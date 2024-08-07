#!/bin/bash
set -e

if [ ! -f "requirements".txt ] || [ ! -f "requirements.yml" ]; then
  echo "Please run this script in the repo's base directory." >&2
  exit 1
fi

echo "*********************************************************************"
echo " Bootstrapping Ansible virtualenv"
echo "*********************************************************************"

if [ -d .venv ]; then
  echo "## Using existing virtualenv at .venv"
else
  echo "## Creating virtualenv at .venv"
  uv venv --seed
fi

echo "## Installing Python packages with uv"
uv pip install -r requirements.txt
source .venv/bin/activate

echo "## Installing Ansible collections"
ansible-galaxy collection install -U -r requirements.yml

echo "## Installing pre-commit hooks"
pre-commit install --install-hooks

if [ -z "$CI" ] && [ ! -d inventory ]; then
  echo "## Cloning inventory repo"
  git clone https://github.com/chrisx8/infra-inventory.git inventory

  echo "## Installing pre-commit hooks for inventory repo"
  pushd inventory > /dev/null
  pre-commit install --install-hooks
  popd > /dev/null
fi
