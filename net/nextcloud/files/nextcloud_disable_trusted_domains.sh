#!/bin/sh
# This script disables trusted domain check for nextcloud
# by pushing * to tursted domain list

if [ ! -f "/srv/www/nextcloud/occ" ]; then
	echo "Error! occ command not found!"
	exit 1
fi

sudo -u nobody php-cli /srv/www/nextcloud/occ config:system:get trusted_domains|grep '*'
if [ "$?" = "0" ]; then
	echo "Trusted domains already disabled.Nothing to do."
else
	echo "Disabling tursted domains."
	sudo -u nobody php-cli /srv/www/nextcloud/occ config:system:set trusted_domains 1000 --value='*'
fi
