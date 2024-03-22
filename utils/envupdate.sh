#!/bin/bash
set -e

if [ ! -d "$INFRA_REPO_DIR" ]; then
  echo "Please run \`source ./activate\` before executing this script." >&2
  exit 1
fi

echo "*********************************************************************"
echo " Updating Ansible virtualenv"
echo "*********************************************************************"

pushd "$INFRA_REPO_DIR" > /dev/null
echo "## Compiling Python package list (requirements.txt)"
uv pip compile requirements.in > requirements.txt
echo "## Updating pre-commit hooks"
pre-commit autoupdate
"$INFRA_REPO_DIR/utils/envsetup.sh"
popd > /dev/null
