#!/bin/bash
set -e

echo "Backing up Postgres databases..."
pg_dumpall -c -f /tmp/pg_dumpall.sql
gzip -f /tmp/pg_dumpall.sql

curl "{{ postgres_cron_ping_url }}"
echo
