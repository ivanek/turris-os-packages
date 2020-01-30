#!/bin/sh
# This script disables trusted domain check for nextcloud
# by pushing * to trusted domain list

NEXTCLOUD_CLI_SCRIPT="/srv/www/nextcloud/occ"

nextcloud_cli() {
	sudo -u nobody php-cli "$NEXTCLOUD_CLI_SCRIPT" "$@"
}

if [ ! -f "/srv/www/nextcloud/occ" ]; then
	echo "Error! occ command not found!"
	exit 1
fi

# check if * is in config.php
ret_val=$(
	nextcloud_cli config:system:get trusted_domains \
		| awk '$1 == "*" { print "isDisabled"; exit }'
)
if [ "$ret_val" = "isDisabled" ]; then
	echo "Trusted domains already disabled.Nothing to do."
else
	echo "Disabling trusted domains."
	nextcloud_cli config:system:set trusted_domains 1000 --value='*'
fi
