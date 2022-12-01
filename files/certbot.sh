#!/bin/bash
set -e
WORKDIR="$1"
OP="$2"

################################################################################
# REQUIRED CONFIGURATION
# 1. In $WORKDIR/env
#    EMAIL = Let's Encrypt email address
#    DOMAINS = domains to issue certs for
# 2. In $WORKDIR/cloudflare.ini
#    dns_cloudflare_api_token = Cloudflare API token
################################################################################

function setup() {
	echo "#####################################################################"
	echo "    chrisx8/infra certbot utilities"
	echo "#####################################################################"
	echo
	echo "Creating certbot environment..."
	python3 -m venv "$WORKDIR/venv"
    # shellcheck source=/dev/null
    source "$WORKDIR/venv/bin/activate"
	echo
	echo "Installing certbot..."
	pip install -U pip wheel
	pip install -U certbot-dns-cloudflare
	echo
}

function issue() {
    DOMAINS=""
	echo "Loading config from $WORKDIR/env"
    # shellcheck source=/dev/null
	source "$WORKDIR/env"
	echo "Issuing certs with certbot..."
	for DOMAIN in $DOMAINS; do
		certbot certonly \
			--config-dir "$WORKDIR/config" \
			--logs-dir "$WORKDIR/log" \
			--work-dir "$WORKDIR/workdir" \
			--no-eff-email --email "$EMAIL" \
			-d "$DOMAIN" \
			--dns-cloudflare \
			--dns-cloudflare-credentials "$WORKDIR/cloudflare.ini"
	done
}

function renew() {
	echo "Renewing certs with certbot..."
	certbot renew \
		--config-dir "$WORKDIR/config" \
		--logs-dir "$WORKDIR/log" \
		--work-dir "$WORKDIR/workdir"
}

if [ -z "$WORKDIR" ]; then
	echo "Usage: certbot.sh WORKDIR (issue|renew)"
	exit 1
fi

case "$OP" in
	"issue")
        setup
		issue
		;;
	"renew")
        setup
		renew
		;;
	*)
		echo "Usage: certbot.sh WORKDIR (issue|renew)"
		exit 1
		;;
esac
