#!/bin/sh

source /opt/config/mod/.shell/0.sh

INC="[include plugins/notify/${ZLANG}/notify.moonraker.cfg]"
FILE="/opt/config/mod_data/plugins.moonraker.conf"

grep -qF "${INC}" "${FILE}" || echo "${INC}" >> "${FILE}"
