cmd_drivers/clk/rockchip/modules.order := {   cat drivers/clk/rockchip/regmap/modules.order; :; } | awk '!x[$$0]++' - > drivers/clk/rockchip/modules.order
