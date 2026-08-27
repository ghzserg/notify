#!/bin/sh

[ -f /opt/config/mod/.shell/0.sh ] && source /opt/config/mod/.shell/0.sh
[ -f /usr/data/zmod/zmod/.shell/0.sh ] && source /usr/data/zmod/zmod/.shell/0.sh

INC="[include plugins/notify/${ZLANG}/notify.moonraker.cfg]"
FILE="/opt/config/mod_data/plugins.moonraker.conf"

grep -qF "${INC}" "${FILE}" || echo "${INC}" >> "${FILE}"
