#!/bin/bash
set -e

for v in $(podman volume ls -q); do
	echo "Backing up $v..."
	tar czf "/tmp/$v.tgz" "/var/lib/containers/storage/volumes/$v/_data/"
done

echo "Listing backups..."
ls -lh /tmp/*.tgz

curl "{{ containers_web_cron_ping_url }}"
echo