#!/bin/bash
set -e

# Download
curl -sS https://getcomposer.org/installer -o composer-setup.php

# Verify
COMPOSER_HASH=$(curl -sS https://composer.github.io/installer.sig)
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$COMPOSER_HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

# Install to /usr/local/bin/composer
php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Delete installer
rm composer-setup.php ~/composer-install.sh
