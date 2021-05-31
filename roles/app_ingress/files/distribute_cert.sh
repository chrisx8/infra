#!/bin/bash
set -e
HOSTS="webhost1 storage iam"

echo "Executing job at $(date)"

echo "Distributing certificate..."
for host in $HOSTS; do
	echo "---> $host"
	scp /etc/ssl/private/{fullchain,privkey}.pem "root@$host:/etc/ssl/private/"
done

echo "Finished at $(date)"
