cmd_drivers/net/ethernet/realtek/r8168/modules.order := {   echo drivers/net/ethernet/realtek/r8168/r8168.ko; :; } | awk '!x[$$0]++' - > drivers/net/ethernet/realtek/r8168/modules.order
