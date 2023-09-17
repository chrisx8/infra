#!/bin/bash
set -e

WORKDIR="$(dirname "${BASH_SOURCE[0]}")/../files/certbot.d"

################################################################################
# REQUIRED CONFIGURATION
# 1. In $WORKDIR/env
#    EMAIL = Let's Encrypt email address
#    DOMAINS = domains to issue certs for
# 2. In $WORKDIR/cloudflare.ini
#    dns_cloudflare_api_token = Cloudflare API token
################################################################################

function fail() {
    echo "Usage: certbot.sh (clean|issue|list|renew|setup)" 1>&2
    exit 1
}

function setup() {
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

function clean() {
    set -ux
    rm -rf "$WORKDIR/venv"
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

function list() {
    certbot certificates \
        --config-dir "$WORKDIR/config" \
        --logs-dir "$WORKDIR/log" \
        --work-dir "$WORKDIR/workdir"
}

echo "#####################################################################"
echo "    chrisx8/infra certbot utilities"
echo "#####################################################################"
echo

[ "$#" != "1" ] && fail

if [ ! -d "$WORKDIR" ]; then
    echo "$WORKDIR is not a valid directory."
    read -r -p "Create? (y/n) " create_dir
    if [ "$create_dir" == "y" ]; then
        mkdir -p "$WORKDIR"
    else
        exit 1
    fi
fi

case "$1" in
    "clean")
        clean
        ;;
    "issue")
        setup
        issue
        ;;
    "list")
        setup
        list
        ;;
    "renew")
        setup
        renew
        ;;
    "setup")
        setup
        ;;
    *)
        fail
        ;;
esac
