#!/bin/bash
set -e

echo "Backing up Jellyfin config..."
pushd "$HOME" > /dev/null
tar czvf "/tmp/jellyfin_config.tgz" "jellyfin/config"
popd > /dev/null

echo "====== List of backups ======"
ls -lh /tmp/*.tgz
echo "============================="

curl "{{ containers_storage_cron_ping_url }}"
echo
