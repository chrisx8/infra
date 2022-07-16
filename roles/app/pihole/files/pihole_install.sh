#!/bin/bash
set -e

# Configuration
export PIHOLE_SKIP_OS_CHECK=true

mkdir -p /etc/pihole
cat > /etc/pihole/setupVars.conf <<EOF
PIHOLE_SKIP_OS_CHECK=true
PIHOLE_DNS_1=1.1.1.1
PIHOLE_DNS_2=1.0.0.1
PIHOLE_INTERFACE=eth0
INSTALL_WEB_SERVER=false
INSTALL_WEB_INTERFACE=true
LIGHTTPD_ENABLED=false
BLOCKING_ENABLED=true
QUERY_LOGGING=false
DNS_FQDN_REQUIRED=true
DNS_BOGUS_PRIV=true
DNSMASQ_LISTENING=all
WEBUIBOXEDLAYOUT=traditional
WEBTHEME=default-auto
EOF

# Modify the official install script to disable dialog
cat > /tmp/pihole_patched.sh <<EOF
shopt -s expand_aliases
alias dialog=echo
EOF
# Add official install script
curl -sSL https://install.pi-hole.net >> /tmp/pihole_patched.sh

# launch install
bash /tmp/pihole_patched.sh --unattended

# remove password
echo | pihole -a -p
