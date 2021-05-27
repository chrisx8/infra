#!/bin/bash
set -e
HOSTS="webhost1 storage iam"

echo "Executing cron jobs at $(date)"

certbot renew

for host in $HOSTS; do
	echo "---> $host"
	scp /etc/letsencrypt/live/tinynet.chrisx.xyz/{fullchain,privkey}.pem "root@$host:/etc/ssl/private/"
done

echo "Finished at $(date)"
