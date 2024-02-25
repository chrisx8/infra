#!/bin/bash
set -e

WORKDIR="$HOME/.certbot"

################################################################################
# REQUIRED CONFIGURATION
# 1. In $WORKDIR/env
#    EMAIL = Let's Encrypt email address
#    DOMAINS = domains to issue certs for
# 2. In $WORKDIR/cloudflare.ini
#    dns_cloudflare_api_token = Cloudflare API token
################################################################################

function fail() {
    echo "Usage: certbot.sh (clean|delete|issue|list|renew|revoke|setup)" 1>&2
    exit 1
}


function clean() {
    set -ux
    rm -rf "$WORKDIR/venv"
}

function delete() {
    certbot delete \
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

function issue() {
    certbot certonly \
        --config-dir "$WORKDIR/config" \
        --logs-dir "$WORKDIR/log" \
        --work-dir "$WORKDIR/workdir" \
        --dns-cloudflare \
        --dns-cloudflare-credentials "$WORKDIR/cloudflare.ini"
}

function renew() {
    certbot renew \
        --config-dir "$WORKDIR/config" \
        --logs-dir "$WORKDIR/log" \
        --work-dir "$WORKDIR/workdir"
}

function revoke() {
    certbot revoke \
        --cert-name "$1" \
        --config-dir "$WORKDIR/config" \
        --logs-dir "$WORKDIR/log" \
        --work-dir "$WORKDIR/workdir"
}

function setup() {
    if [ ! -d "$WORKDIR" ]; then
        echo "$WORKDIR is not a valid directory."
        read -r -p "Create? (y/n) " create_dir
        if [ "$create_dir" == "y" ]; then
            mkdir -p "$WORKDIR"
        else
            exit 1
        fi
    fi
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

echo "#####################################################################"
echo "    chrisx8/infra certbot utilities"
echo "#####################################################################"
echo

[ $# -gt 0 ] || fail

if [ "$1" != "setup" ] && [ ! -f "$WORKDIR/venv/bin/activate" ]; then
    echo "Certbot virtualenv has not been set up!" >&2
    fail
fi

# shellcheck source=/dev/null
[ "$1" == "setup" ] || source "$WORKDIR/venv/bin/activate"

case "$1" in
    "clean")
        clean
        ;;
    "delete")
        delete
        ;;
    "issue")
        issue
        ;;
    "list")
        list
        ;;
    "renew")
        renew
        ;;
    "revoke")
        revoke "$2"
        ;;
    "setup")
        setup
        ;;
    *)
        fail
        ;;
esac
