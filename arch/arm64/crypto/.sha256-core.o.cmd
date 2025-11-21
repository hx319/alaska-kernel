cmd_arch/arm64/crypto/sha256-core.o := clang -Wp,-MMD,arch/arm64/crypto/.sha256-core.o.d -nostdinc -isystem /home/wade/workspace/alaska-screen/PET_RK3562_P01_Android13/prebuilts/clang/host/linux-x86/clang-r450784d/lib64/clang/14.0.6/include -I./arch/arm64/include -I./arch/arm64/include/generated  -I./include -I./arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT= -Qunused-arguments -fmacro-prefix-map=./= -D__ASSEMBLY__ -fno-PIE --target=aarch64-linux-gnu -integrated-as -Werror=unknown-warning-option -fno-asynchronous-unwind-tables -fno-unwind-tables -DKASAN_SHADOW_SCALE_SHIFT= -g    -c -o arch/arm64/crypto/sha256-core.o arch/arm64/crypto/sha256-core.S

source_arch/arm64/crypto/sha256-core.o := arch/arm64/crypto/sha256-core.S

deps_arch/arm64/crypto/sha256-core.o := \
  include/linux/kconfig.h \
    $(wildcard include/config/cc/version/text.h) \
    $(wildcard include/config/cpu/big/endian.h) \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \

arch/arm64/crypto/sha256-core.o: $(deps_arch/arm64/crypto/sha256-core.o)

$(deps_arch/arm64/crypto/sha256-core.o):
