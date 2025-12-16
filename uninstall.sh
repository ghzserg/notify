#!/bin/sh

source /opt/config/mod/.shell/0.sh

FILE="/opt/config/mod_data/plugins.moonraker.conf"

sed -i "\|plugins/notify/${ZLANG}/moonraker\.notify\.cfg|d" "$FILE"

rm -f /opt/config/mod/.shell/root/moonraker/components/notify.py
rm -rf /root/printer_data/gcodes/notify

echo "Moonraker Notify Uninstalled"
echo "REBOOT" >/tmp/printer
