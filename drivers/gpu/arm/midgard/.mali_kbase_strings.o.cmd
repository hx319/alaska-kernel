cmd_drivers/gpu/arm/midgard/mali_kbase_strings.o := clang -Wp,-MMD,drivers/gpu/arm/midgard/.mali_kbase_strings.o.d -nostdinc -isystem /home/wade/workspace/alaska-screen/PET_RK3562_P01_Android13/prebuilts/clang/host/linux-x86/clang-r450784d/lib64/clang/14.0.6/include -I./arch/arm64/include -I./arch/arm64/include/generated  -I./include -I./arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT= -Qunused-arguments -fmacro-prefix-map=./= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu89 --target=aarch64-linux-gnu -integrated-as -Werror=unknown-warning-option -mgeneral-regs-only -DCONFIG_CC_HAS_K_CONSTRAINT=1 -Wno-psabi -fno-asynchronous-unwind-tables -fno-unwind-tables -mbranch-protection=none -Wa,-march=armv8.5-a -DARM64_ASM_ARCH='"armv8.5-a"' -ffixed-x18 -DKASAN_SHADOW_SCALE_SHIFT= -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-packed-member -O2 -Wframe-larger-than=2048 -fstack-protector-strong -Werror -Wno-format-invalid-specifier -Wno-gnu -mno-global-merge -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=zero -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang -g -fsanitize=shadow-call-stack -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werror=date-time -Werror=incompatible-pointer-types -Wno-initializer-overrides -Wno-format -Wno-sign-compare -Wno-format-zero-length -Wno-pointer-to-enum-cast -Wno-tautological-constant-out-of-range-compare -Wno-unaligned-access -mstack-protector-guard=sysreg -mstack-protector-guard-reg=sp_el0 -mstack-protector-guard-offset=1480 -include rename.h -DMALI_CUSTOMER_RELEASE=1 -DMALI_KERNEL_TEST_API=0 -DMALI_UNIT_TEST=0 -DMALI_ERROR_INJECT_ON=0 -DMALI_MOCK_TEST=0 -DMALI_COVERAGE=0 -DMALI_INSTRUMENTATION_LEVEL=0 -DMALI_RELEASE_NAME=\""r18p0-01rel0"\" -DMALI_GCC_WORKAROUND_MIDCOM_4598=0 -DMALI_KBASE_THIRDPARTY_PATH=../.././drivers/gpu/arm/midgard/platform/"rk" -I./drivers/staging/android -I./drivers/gpu/arm/midgard -I./drivers/gpu/arm/midgard/platform_dummy -I -I./drivers/gpu/arm/midgard/../../../base -I./include/linux -I./drivers/gpu/arm/midgard/backend/gpu -DMALI_CUSTOMER_RELEASE=1 -DMALI_KERNEL_TEST_API=0 -DMALI_UNIT_TEST=0 -DMALI_ERROR_INJECT_ON=0 -DMALI_MOCK_TEST=0 -DMALI_COVERAGE=0 -DMALI_INSTRUMENTATION_LEVEL=0 -DMALI_RELEASE_NAME=\""r18p0-01rel0"\" -DMALI_GCC_WORKAROUND_MIDCOM_4598=0 -DMALI_KBASE_THIRDPARTY_PATH=../.././drivers/gpu/arm/midgard/platform/"rk" -I./drivers/staging/android -I./drivers/gpu/arm/midgard -I./drivers/gpu/arm/midgard/platform_dummy -I./drivers/gpu/arm/midgard/../../../base -I./include/linux -I./drivers/gpu/arm/midgard -I./drivers/gpu/arm/midgard/platform/rk -I./drivers/gpu/arm/midgard/backend/gpu    -DKBUILD_MODFILE='"drivers/gpu/arm/midgard/midgard_kbase"' -DKBUILD_BASENAME='"mali_kbase_strings"' -DKBUILD_MODNAME='"midgard_kbase"' -D__KBUILD_MODNAME=kmod_midgard_kbase -c -o drivers/gpu/arm/midgard/mali_kbase_strings.o drivers/gpu/arm/midgard/mali_kbase_strings.c

source_drivers/gpu/arm/midgard/mali_kbase_strings.o := drivers/gpu/arm/midgard/mali_kbase_strings.c

deps_drivers/gpu/arm/midgard/mali_kbase_strings.o := \
  include/linux/kconfig.h \
    $(wildcard include/config/cc/version/text.h) \
    $(wildcard include/config/cpu/big/endian.h) \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
  include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/cc/has/asm/inline.h) \
  include/linux/compiler_attributes.h \
  include/linux/compiler-clang.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  arch/arm64/include/asm/compiler.h \
  drivers/gpu/arm/midgard/rename.h \
    $(wildcard include/config/debug/fs.h) \
    $(wildcard include/config/mali/no/mali.h) \
  drivers/gpu/arm/midgard/mali_kbase_strings.h \

drivers/gpu/arm/midgard/mali_kbase_strings.o: $(deps_drivers/gpu/arm/midgard/mali_kbase_strings.o)

$(deps_drivers/gpu/arm/midgard/mali_kbase_strings.o):
