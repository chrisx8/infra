#!/bin/bash
set -e

RID="$(uuidgen)"

curl -fsS -m 3 "{{ containers_storage_cron_ping_url }}/start?rid=$RID"
echo "[Healthchecks start]"

echo "Backing up Jellyfin config..."
pushd "$HOME" > /dev/null
tar czvf "/tmp/jellyfin_config.tgz" "jellyfin/config"
popd > /dev/null

echo "====== List of backups ======"
ls -lh /tmp/*.tgz
echo "============================="

curl -fsS -m 3 "{{ containers_storage_cron_ping_url }}?rid=$RID"
echo "[Healthchecks done]"
