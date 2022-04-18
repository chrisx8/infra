#!/bin/bash
set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

################################################################################
# REQUIRED CONFIGURATION
# 1. In certbot/env
#    EMAIL = Let's Encrypt email address
#    DOMAINS = domains to issue certs for
# 2. In certbot/cloudflare.ini
#    dns_cloudflare_api_token = Cloudflare API token
################################################################################

source $SCRIPT_DIR/certbot/env

echo "This will issue a new SSL certificate for $DOMAINS. Continue?"
read -p "Press Enter to continue..."
echo
echo "Creating certbot environment..."
python3 -m venv /tmp/certbot.env
source "/tmp/certbot.env/bin/activate"
echo
echo "Installing certbot..."
pip install -U pip wheel
pip install certbot-dns-cloudflare
echo
echo "Issuing certs with certbot..."
for DOMAIN in $DOMAINS; do
	certbot certonly \
		--config-dir "$SCRIPT_DIR/certbot/config" \
		--logs-dir "$SCRIPT_DIR/certbot/log" \
		--work-dir "$SCRIPT_DIR/certbot/workdir" \
		--no-eff-email --email "$EMAIL" \
		-d "$DOMAIN" \
		--dns-cloudflare \
		--dns-cloudflare-credentials "$SCRIPT_DIR/certbot/cloudflare.ini"
done
