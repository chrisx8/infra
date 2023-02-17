#!/bin/bash
set -e

readarray -t blocked_domains < /etc/pihole/regex.list

for domain in "${blocked_domains[@]}"; do
	[ -z "$domain" ] || pihole --wild "$domain"
done
