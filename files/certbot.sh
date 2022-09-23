#!/bin/bash
set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

################################################################################
# REQUIRED CONFIGURATION
# 1. In certbot.d/env
#    EMAIL = Let's Encrypt email address
#    DOMAINS = domains to issue certs for
# 2. In certbot.d/cloudflare.ini
#    dns_cloudflare_api_token = Cloudflare API token
################################################################################

function setup() {
	echo "#####################################################################"
	echo "    tinynet-infra certbot utilities"
	echo "#####################################################################"
	echo
	echo "This will install certbot to /tmp/certbot.env, and issue/renew certs."
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
}

function issue() {
	echo "Loading config from $SCRIPT_DIR/certbot.d/env"
	source "$SCRIPT_DIR/certbot.d/env"
	echo "Issuing certs with certbot..."
	for DOMAIN in $DOMAINS; do
		certbot certonly \
			--config-dir "$SCRIPT_DIR/certbot.d/config" \
			--logs-dir "$SCRIPT_DIR/certbot.d/log" \
			--work-dir "$SCRIPT_DIR/certbot.d/workdir" \
			--no-eff-email --email "$EMAIL" \
			-d "$DOMAIN" \
			--dns-cloudflare \
			--dns-cloudflare-credentials "$SCRIPT_DIR/certbot.d/cloudflare.ini"
	done
}

function renew() {
	echo "Renewing certs with certbot..."
	certbot renew \
		--config-dir "$SCRIPT_DIR/certbot.d/config" \
		--logs-dir "$SCRIPT_DIR/certbot.d/log" \
		--work-dir "$SCRIPT_DIR/certbot.d/workdir"
}

case "$1" in
	"issue")
		setup
		issue
		;;
	"renew")
		setup
		renew
		;;
	*)
		echo "Usage: certbot.sh (issue|renew)"
		exit 1
		;;
esac
