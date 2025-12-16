#!/bin/sh

source /opt/config/mod/.shell/0.sh

if [ "$1" == 1 ]; then
    cp /opt/config/mod_data/notify.txt ${MOD}/root/printer_data/moonraker.secrets
else
    cp ${MOD}/root/printer_data/moonraker.secrets /opt/config/mod_data/notify.txt
fi
