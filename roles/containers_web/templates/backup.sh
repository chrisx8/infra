#!/bin/bash
set -e

RID="$(uuidgen)"

curl -fsS -m 3 "{{ containers_web_cron_ping_url }}/start?rid=$RID"
echo "[Healthchecks start]"

for v in $(podman volume ls -q); do
    echo "Backing up $v..."
    pushd "$HOME/.local/share/containers/storage/volumes/$v" > /dev/null
    podman unshare tar czvf "/tmp/$v.tgz" "_data/"
    popd > /dev/null
done

echo "====== List of backups ======"
ls -lh /tmp/*.tgz
echo "============================="

curl -fsS -m 3 "{{ containers_web_cron_ping_url }}?rid=$RID"
echo "[Healthchecks done]"
