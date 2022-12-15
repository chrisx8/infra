#!/bin/bash
set -e

VOLUMES="{% for v in container_volumes %} {{ v.name if v.backup else '' }} {% endfor %}"

for v in $VOLUMES; do
	echo "Backing up $v..."
	tar czf "/home/chrisx/Backup/arb.chrisx.xyz/$v.tgz" "/var/lib/containers/storage/volumes/$v/_data/"
done

echo "Listing backups..."
ls -lh /home/chrisx/Backup/arb.chrisx.xyz/*.tgz

curl "{{ containers_storage_cron_ping_url }}"
echo
