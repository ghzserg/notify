#!/bin/sh

[ -f /opt/config/mod/.shell/0.sh ] && source /opt/config/mod/.shell/0.sh
[ -f /usr/data/zmod/zmod/.shell/0.sh ] && source /usr/data/zmod/zmod/.shell/0.sh

FILE="/opt/config/mod_data/plugins.moonraker.conf"

sed -i "\|plugins/notify/${ZLANG}/notify\.moonraker\.cfg|d" "$FILE"

rm -rf /root/printer_data/gcodes/notify

echo "Moonraker Notify Uninstalled"
echo "REBOOT" >/tmp/printer
