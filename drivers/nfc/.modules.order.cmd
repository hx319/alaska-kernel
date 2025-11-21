cmd_drivers/nfc/modules.order := {   cat drivers/nfc/nxp-nfc/modules.order; :; } | awk '!x[$$0]++' - > drivers/nfc/modules.order
