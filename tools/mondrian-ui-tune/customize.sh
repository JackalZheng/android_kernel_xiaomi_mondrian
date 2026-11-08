#!/system/bin/sh
ui_print "Mondrian only: post-boot UI tuning; disable and reboot to undo."
[ "$(getprop ro.product.device)" = mondrian ] || abort "This module is for mondrian only"
set_perm "$MODPATH/service.sh" 0 0 0755
