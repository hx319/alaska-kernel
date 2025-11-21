cmd_arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtb := clang -E -Wp,-MMD,arch/arm64/boot/dts/rockchip/.rk3562-gzpeite.dtb.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm64/boot/dts/rockchip/.rk3562-gzpeite.dtb.dts.tmp arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dts ; ./scripts/dtc/dtc -O dtb -o arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtb -b 0 -iarch/arm64/boot/dts/rockchip/ -i./scripts/dtc/include-prefixes -Wno-interrupt_provider -@ -Wno-unit_address_vs_reg -Wno-unit_address_format -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-graph_child_address -Wno-simple_bus_reg -Wno-unique_unit_address -Wno-pci_device_reg  -d arch/arm64/boot/dts/rockchip/.rk3562-gzpeite.dtb.d.dtc.tmp arch/arm64/boot/dts/rockchip/.rk3562-gzpeite.dtb.dts.tmp ; cat arch/arm64/boot/dts/rockchip/.rk3562-gzpeite.dtb.d.pre.tmp arch/arm64/boot/dts/rockchip/.rk3562-gzpeite.dtb.d.dtc.tmp > arch/arm64/boot/dts/rockchip/.rk3562-gzpeite.dtb.d

source_arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtb := arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dts

deps_arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtb := \
  arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h \
  scripts/dtc/include-prefixes/dt-bindings/display/drm_mipi_dsi.h \
  scripts/dtc/include-prefixes/dt-bindings/display/media-bus-format.h \
  scripts/dtc/include-prefixes/dt-bindings/display/../../uapi/linux/media-bus-format.h \
  scripts/dtc/include-prefixes/dt-bindings/input/input.h \
  scripts/dtc/include-prefixes/dt-bindings/input/linux-event-codes.h \
  scripts/dtc/include-prefixes/dt-bindings/pinctrl/rockchip.h \
  scripts/dtc/include-prefixes/dt-bindings/sensor-dev.h \
  arch/arm64/boot/dts/rockchip/rk3562.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/clock/rk3562-cru.h \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/arm-gic.h \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/irq.h \
  scripts/dtc/include-prefixes/dt-bindings/phy/phy.h \
  scripts/dtc/include-prefixes/dt-bindings/power/rk3562-power.h \
  scripts/dtc/include-prefixes/dt-bindings/soc/rockchip,boot-mode.h \
  scripts/dtc/include-prefixes/dt-bindings/soc/rockchip-system-status.h \
  scripts/dtc/include-prefixes/dt-bindings/suspend/rockchip-rk3562.h \
  scripts/dtc/include-prefixes/dt-bindings/thermal/thermal.h \
  arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi \
  arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi \

arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtb: $(deps_arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtb)

$(deps_arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtb):
