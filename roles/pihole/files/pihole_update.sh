#!/bin/bash
set -e

PIHOLE_SKIP_OS_CHECK=true pihole -up

echo
echo 'Patching sudoers'
sed -i s/lighttpd/apache/g /etc/sudoers.d/pihole
echo 'OK'
