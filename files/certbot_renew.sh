#!/bin/bash
set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "This will renew all SSL certificates. Continue?"
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
echo "Renewing certs with certbot..."
certbot renew \
	--config-dir "$SCRIPT_DIR/certbot/config" \
	--logs-dir "$SCRIPT_DIR/certbot/log" \
	--work-dir "$SCRIPT_DIR/certbot/workdir" \
