#!/bin/bash
usage()
{
  echo "USAGE: [-U] [-K] [-A] [-p] [-o] [-u] [-c] [-h] [-v VERSION_NAME]  "
  echo "No ARGS means use default build option                  "
  echo "WHERE: -U = build uboot                                 "
  echo "       -K = build kernel with Clang                     "
  echo "       -A = build android                               "
  echo "       -p = will build packaging in IMAGE               "
  echo "       -o = build OTA package                           "
  echo "       -u = build update.img                            "
  echo "       -v = build android with 'user' or 'userdebug'    "
  echo "       -d = build kernel dts name                       "
  echo "       -m = build kernel menuconfig                     "
  echo "       -V = build version                               "
  echo "       -J = build jobs                                  "
  echo "       -j = build rk3562j                               "
  echo "       -c = cleanall                                    "
  echo "       -l = build lvds lcd                              "
  echo "       -r = build rgb lcd                              "
  exit 1
}

color_success=$'\E'"[0;32m"
color_failed=$'\E'"[0;31m"
color_reset=$'\E'"[00m"
START_TIME=`date +%s`
TOP_DIR=$(cd `dirname $0` ; pwd)

source build/envsetup.sh >/dev/null
TARGET_PRODUCT=`get_build_var TARGET_PRODUCT`
if [ "$TARGET_PRODUCT" != "rk3562_t" ]; then
  echo -n "lunch rk3562_t-userdebug"
  echo " ${color_reset}"
  lunch rk3562_t-userdebug
fi

BUILD_UBOOT=false
BUILD_KERNEL_WITH_CLANG=false
BUILD_KERNEL=false
BUILD_KERNEL_MENU=false
BUILD_ANDROID=false
BUILD_AB_IMAGE=`get_build_var BOARD_USES_AB_IMAGE`
BUILD_UPDATE_IMG=false
BUILD_OTA=false
BUILD_PACKING=false
BUILD_VARIANT=`get_build_var TARGET_BUILD_VARIANT`
KERNEL_DTS=""
BUILD_VERSION=""
BUILD_JOBS=`cat /proc/cpuinfo | grep "processor" | wc -l`
BUILD_CLEANALL=false
BUILD_KERNEL_RK3562J=false
export LC_ALL=C

if [ $# -eq 0 ] ; then
  echo -n "${color_success}will build uboot/kernel/android/update_img"
  echo " ${color_reset}"
  BUILD_UBOOT=true
  BUILD_KERNEL_WITH_CLANG=true
  BUILD_KERNEL=true
  BUILD_ANDROID=true
  BUILD_UPDATE_IMG=true
fi

# check pass argument
while getopts "jUcCkKABpouvmh:d:V:J:lr" arg
do
  case $arg in
    U)
      echo -n "${color_success}will build u-boot"
      echo " ${color_reset}"
      BUILD_UBOOT=true
      ;;
    c|C)
      echo -n "${color_success}will cleanall !!!"
      echo " ${color_reset}"
      BUILD_CLEANALL=true
      ;;
    k|K)
      echo -n "${color_success}will build kernel with Clang"
      echo " ${color_reset}"
      BUILD_KERNEL=true
      BUILD_KERNEL_WITH_CLANG=true
      ;;
    A)
      echo -n "${color_success}will build android"
      echo " ${color_reset}"
      BUILD_ANDROID=true
      ;;
    B)
      echo -n "${color_success}will build AB Image"
      echo " ${color_reset}"
      BUILD_AB_IMAGE=true
      ;;
    p)
      echo -n "${color_success}will build packaging in IMAGE"
      echo " ${color_reset}"
      BUILD_PACKING=true
      ;;
    o)
      echo -n "${color_success}will build ota package"
      echo " ${color_reset}"
      BUILD_OTA=true
      ;;
    u)
      echo -n "${color_success}will build update.img"
      echo " ${color_reset}"
      BUILD_UPDATE_IMG=true
      ;;
    m)
      echo -n "${color_success}will build kernel menuconfig"
      echo " ${color_reset}"
      BUILD_KERNEL_WITH_CLANG=true
      BUILD_KERNEL_MENU=true
      ;;
    j)
      BUILD_KERNEL_RK3562J=true
      BUILD_UBOOT=true
      BUILD_KERNEL_WITH_CLANG=true
      BUILD_KERNEL=true
      BUILD_ANDROID=true
      BUILD_UPDATE_IMG=true
      ;;
    v)
      BUILD_VARIANT=$OPTARG
      ;;
    V)
      BUILD_VERSION=$OPTARG
      ;;
    d)
      KERNEL_DTS=$OPTARG
      ;;
    J)
      BUILD_JOBS=$OPTARG
      ;;
    l)
      echo -n "${color_success}will build lvds lcd"
      echo " ${color_reset}"
      cp $TOP_DIR/rk3562-gzpeite-lvds.dts $TOP_DIR/kernel-5.10/arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dts
      cp $TOP_DIR/rk3562-gzpeite-lvds.dtsi $TOP_DIR/kernel-5.10/arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtsi
      cp $TOP_DIR/rk3562_t_lvds.mk $TOP_DIR/device/rockchip/rk3562/rk3562_t/rk3562_t.mk
      ;;
    r)
      echo -n "${color_success}will build rgb lcd"
      echo " ${color_reset}"
      cp $TOP_DIR/rk3562-gzpeite-rgb.dts $TOP_DIR/kernel-5.10/arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dts
      cp $TOP_DIR/rk3562-gzpeite-rgb.dtsi $TOP_DIR/kernel-5.10/arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtsi
      cp $TOP_DIR/rk3562_t_rgb.mk $TOP_DIR/device/rockchip/rk3562/rk3562_t/rk3562_t.mk
      ;;
    h|?)
      usage ;;
  esac
done

TARGET_PRODUCT=`get_build_var TARGET_PRODUCT`
TARGET_BOARD_PLATFORM=`get_build_var TARGET_BOARD_PLATFORM`

#set jdk version
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
# export PATH=$JAVA_HOME/bin:$PATH
export PATH=$ANDROID_BUILD_TOP/prebuilts/clang/host/linux-x86/clang-r450784d/bin:$PATH
# export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar

# source environment and chose target product
BUILD_NUMBER=`get_build_var BUILD_NUMBER`
BUILD_ID=`get_build_var BUILD_ID`
# only save the version code
SDK_VERSION=`get_build_var CURRENT_SDK_VERSION`
UBOOT_DEFCONFIG=`get_build_var PRODUCT_UBOOT_CONFIG`
KERNEL_VERSION=`get_build_var PRODUCT_KERNEL_VERSION`
KERNEL_ARCH=`get_build_var PRODUCT_KERNEL_ARCH`
KERNEL_DEFCONFIG=`get_build_var PRODUCT_KERNEL_CONFIG`
if [ "$KERNEL_DTS" = "" ] ; then
  KERNEL_DTS=`get_build_var PRODUCT_KERNEL_DTS`
fi
  LOCAL_KERNEL_PATH=kernel-$KERNEL_VERSION
echo "-------------------KERNEL_VERSION:$KERNEL_VERSION"
echo "-------------------KERNEL_DTS:$KERNEL_DTS"

if [ "$KERNEL_VERSION" = "5.10" ] ; then
  echo "Force use clang and llvm to build kernel-$KERNEL_VERSION"
  BUILD_KERNEL_WITH_CLANG=true
fi

PACK_TOOL_DIR=RKTools/linux/Linux_Pack_Firmware
IMAGE_PATH=rockdev/Image-$TARGET_PRODUCT
export PROJECT_TOP=`gettop`

lunch $TARGET_PRODUCT-$BUILD_VARIANT

# DATE=$(date  +%Y%m%d.%H%M)
# STUB_PATH=Image/"$TARGET_PRODUCT"_"$BUILD_VARIANT"_"$KERNEL_DTS"_"$BUILD_VERSION"_"$DATE"
STUB_PATH=Image/"$TARGET_PRODUCT"_"$BUILD_VARIANT"_"$KERNEL_DTS"_"$BUILD_VERSION"
STUB_PATH="$(echo $STUB_PATH | tr '[:lower:]' '[:upper:]')"
export STUB_PATH=$PROJECT_TOP/$STUB_PATH
export STUB_PATCH_PATH=$STUB_PATH/PATCHES

#######################################################################################################################################
# build uboot
if [ "$BUILD_UBOOT" = true ] ; then
  echo "start build uboot use config $UBOOT_DEFCONFIG"
  cd u-boot && make clean &&  make mrproper &&  make distclean && ./make.sh $UBOOT_DEFCONFIG && cd -
  if [ $? -eq 0 ]; then
    echo -n "${color_success}Build uboot ok!"
    echo " ${color_reset}"
  else
    echo -n "${color_failed}Build uboot failed!"
    echo " ${color_reset}"
    exit 1
  fi
fi

#######################################################################################################################################
# build kernel
if [ "$BUILD_KERNEL_WITH_CLANG" = true ] ; then
  if [ "$KERNEL_ARCH" = "arm64" ]; then
    ADDON_ARGS="CROSS_COMPILE=aarch64-linux-gnu- LLVM=1 LLVM_IAS=1"
  else
    ADDON_ARGS="CC=clang LD=ld.lld"
  fi
fi

if [ "$BUILD_KERNEL_MENU" = true ] ; then
  echo "Start build kernel menuconfig use config $KERNEL_DEFCONFIG"
  cd $LOCAL_KERNEL_PATH && make $ADDON_ARGS ARCH=$KERNEL_ARCH $KERNEL_DEFCONFIG menuconfig && cd -
  exit 0
fi

if [ "$BUILD_KERNEL" = true ] ; then
  echo "Start build kernel use config $KERNEL_DEFCONFIG"
  sed -i '/rk3562j_gzpeite.dtsi/'d $LOCAL_KERNEL_PATH/arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtsi
  if [ "$BUILD_KERNEL_RK3562J" = true ] ; then
    echo "Start build kernel for rk3562j"
    echo "#include \"rk3562j_gzpeite.dtsi\"" >> $LOCAL_KERNEL_PATH/arch/arm64/boot/dts/rockchip/rk3562-gzpeite.dtsi
  fi
  # cd $LOCAL_KERNEL_PATH && make clean && make $ADDON_ARGS ARCH=$KERNEL_ARCH $KERNEL_DEFCONFIG && make $ADDON_ARGS ARCH=$KERNEL_ARCH $KERNEL_DTS.img -j$BUILD_JOBS && cd -
  cd $LOCAL_KERNEL_PATH && make $ADDON_ARGS ARCH=$KERNEL_ARCH $KERNEL_DEFCONFIG && make $ADDON_ARGS ARCH=$KERNEL_ARCH $KERNEL_DTS.img -j$BUILD_JOBS && cd -
  if [ $? -eq 0 ]; then
    echo -n "${color_success}Build kernel ok!"
    echo " ${color_reset}"
  else
    echo -n "${color_failed}Build kernel failed!"
    echo " ${color_reset}"
    exit 1
  fi

  # build exteranl wifi driver
  LOCAL_EXT_WIFI_DRIVER_PATH=external/wifi_driver
  if [ -d $LOCAL_EXT_WIFI_DRIVER_PATH ]; then
    source $LOCAL_EXT_WIFI_DRIVER_PATH/set_android_version.sh $LOCAL_EXT_WIFI_DRIVER_PATH
    echo "Start build exteranl wifi driver"
    cd $LOCAL_EXT_WIFI_DRIVER_PATH && make $ADDON_ARGS ARCH=$KERNEL_ARCH -C ../../$LOCAL_KERNEL_PATH M=$PWD clean && cd -
    cd $LOCAL_EXT_WIFI_DRIVER_PATH && make $ADDON_ARGS ARCH=$KERNEL_ARCH -C ../../$LOCAL_KERNEL_PATH M=$PWD -j$BUILD_JOBS && cd -
    if [ $? -eq 0 ]; then
      echo -n "${color_success}Build exteranl wifi driver ok!"
      echo " ${color_reset}"
    else
      echo -n "${color_failed}Build exteranl wifi driver failed!"
      echo " ${color_reset}"
      exit 1
    fi
  fi

  if [ "$KERNEL_ARCH" = "arm64" ]; then
    KERNEL_DEBUG=$LOCAL_KERNEL_PATH/arch/arm64/boot/Image
  else
    KERNEL_DEBUG=$LOCAL_KERNEL_PATH/arch/arm/boot/zImage
  fi
  cp -rf $KERNEL_DEBUG $OUT/kernel
fi

#######################################################################################################################################
if [ "$BUILD_CLEANALL" != true ] ; then
  echo -n "${color_success}package resoure.img with charger images"
  echo " ${color_reset}"
  cd u-boot && ./scripts/pack_resource.sh ../$LOCAL_KERNEL_PATH/resource.img && cp resource.img ../$LOCAL_KERNEL_PATH/resource.img && cd -
fi

#######################################################################################################################################
# build android
if [ "$BUILD_ANDROID" = true ] ; then
  # build OTA
  if [ "$BUILD_OTA" = true ] ; then
    INTERNAL_OTA_PACKAGE_OBJ_TARGET=obj/PACKAGING/target_files_intermediates/$TARGET_PRODUCT-target_files-*.zip
    INTERNAL_OTA_PACKAGE_TARGET=$TARGET_PRODUCT-ota-*.zip
    if [ "$BUILD_AB_IMAGE" = true ] ; then
      echo "make ab image and generate ota package"
      make installclean
      make -j$BUILD_JOBS
      # check the result of make
      if [ $? -eq 0 ]; then
        echo -n "${color_success}Build android ok!"
        echo " ${color_reset}"
      else
        echo -n "${color_failed}Build android failed!"
        echo " ${color_reset}"
        exit 1
      fi

      make dist -j$BUILD_JOBS
      # check the result of make
      if [ $? -eq 0 ]; then
        echo -n "${color_success}Build android ok!"
        echo " ${color_reset}"
      else
        echo -n "${color_failed}Build android failed!"
        echo " ${color_reset}"
        exit 1
      fi
      ./mkimage_ab.sh ota
      # check the result of make
      if [ $? -eq 0 ]; then
        echo -n "${color_success}Build android ok!"
        echo " ${color_reset}"
      else
        echo -n "${color_failed}Build android failed!"
        echo " ${color_reset}"
        exit 1
      fi
    else
      echo -n "${color_success}generate ota package"
      echo " ${color_reset}"
      make installclean
      make -j$BUILD_JOBS
      # check the result of make
      if [ $? -eq 0 ]; then
        echo -n "${color_success}Build android ok!"
        echo " ${color_reset}"
      else
        echo -n "${color_failed}Build android failed!"
        echo " ${color_reset}"
        exit 1
      fi
      make dist -j$BUILD_JOBS
      # check the result of make
      if [ $? -eq 0 ]; then
        echo -n "${color_success}Build android ok!"
        echo " ${color_reset}"
      else
        echo -n "${color_failed}Build android failed!"
        echo " ${color_reset}"
        exit 1
      fi
      ./mkimage.sh ota
      # check the result of make
      if [ $? -eq 0 ]; then
        echo -n "${color_success}Build android ok!"
        echo " ${color_reset}"
      else
        echo -n "${color_failed}Build android failed!"
        echo " ${color_reset}"
        exit 1
      fi
    fi
    cp $OUT/$INTERNAL_OTA_PACKAGE_TARGET $IMAGE_PATH/
    cp $OUT/$INTERNAL_OTA_PACKAGE_OBJ_TARGET $IMAGE_PATH/
  else # regular build without OTA
    echo -n "${color_success}start build android"
    echo " ${color_reset}"
    make installclean
#    make -j$BUILD_JOBS update-api
    make -j$BUILD_JOBS
    # check the result of make
    if [ $? -eq 0 ]; then
      echo -n "${color_success}Build android ok!"
      echo " ${color_reset}"
    else
      echo -n "${color_failed}Build android failed!"
      echo " ${color_reset}"
      exit 1
    fi
  fi
else # repack v2 boot
  if [ "$BUILD_CLEANALL" != true ] ; then
    echo -n "${color_success}Repacking header 2 boot..."
    echo " ${color_reset}"
    BOOT_CMDLINE=`get_build_var BOARD_KERNEL_CMDLINE`
    SECURITY_LEVEL=`get_build_var PLATFORM_SECURITY_PATCH`
    mkbootfs -d $OUT/system $OUT/ramdisk | minigzip > $OUT/ramdisk.img
    mkbootimg --kernel $OUT/kernel --ramdisk $OUT/ramdisk.img --dtb $OUT/dtb.img --cmdline "$BOOT_CMDLINE" --os_version 12 --os_patch_level $SECURITY_LEVEL --second $LOCAL_KERNEL_PATH/resource.img --header_version 2 --output $OUT/boot.img
  fi
fi

#######################################################################################################################################
# build ota
if [ "$BUILD_OTA" != true ] && [ "$BUILD_CLEANALL" != true ] ; then
  # mkimage.sh
  echo "make and copy android images"
  ./mkimage.sh
  if [ $? -eq 0 ]; then
    echo "Make image ok!"
  else
    echo "Make image failed!"
    exit 1
  fi
fi

#######################################################################################################################################
# build update image
if [ "$BUILD_UPDATE_IMG" = true ] && [ "$BUILD_CLEANALL" != true ] ; then
  mkdir -p $PACK_TOOL_DIR/rockdev/Image/
  cp -f $IMAGE_PATH/* $PACK_TOOL_DIR/rockdev/Image/

  echo -n "${color_success}Make update.img"
  echo " ${color_reset}"
  if [[ $TARGET_PRODUCT =~ "PX30" ]]; then
    cd $PACK_TOOL_DIR/rockdev && ./mkupdate.sh px30 Image
      elif [[ $TARGET_PRODUCT =~ "rk356x_box" ]]; then
    if [ "$BUILD_AB_IMAGE" = true ] ; then
      cd $PACK_TOOL_DIR/rockdev && ./mkupdate_ab_$TARGET_PRODUCT.sh
    else
      cd $PACK_TOOL_DIR/rockdev && ./mkupdate_$TARGET_PRODUCT.sh
    fi
  else
    cd $PACK_TOOL_DIR/rockdev && ./mkupdate.sh $TARGET_BOARD_PLATFORM Image
  fi

  if [ $? -eq 0 ]; then
    echo -n "${color_success}Make update image ok!"
    echo " ${color_reset}"
  else
    echo -n "${color_failed}Make update image failed!"
    echo " ${color_reset}"
    exit 1
  fi
  cd -
  mv $PACK_TOOL_DIR/rockdev/update.img $IMAGE_PATH/ -f
  rm $PACK_TOOL_DIR/rockdev/Image -rf
fi

#######################################################################################################################################
# build pack
if [ "$BUILD_PACKING" = true ] ; then
  echo -n "${color_success}make and copy packaging in IMAGE "
  echo " ${color_reset}"

  mkdir -p $STUB_PATH
  mkdir -p $STUB_PATH/IMAGES/
  cp $IMAGE_PATH/* $STUB_PATH/IMAGES/

  #Generate patches

  # .repo/repo/repo forall  -c "$PROJECT_TOP/device/rockchip/common/gen_patches_body.sh"
  # .repo/repo/repo manifest -r -o out/commit_id.xml
  #Copy stubs
  # cp out/commit_id.xml $STUB_PATH/manifest_${DATE}.xml

  mkdir -p $STUB_PATCH_PATH/kernel
  cp $LOCAL_KERNEL_PATH/.config $STUB_PATCH_PATH/kernel
  cp $LOCAL_KERNEL_PATH/vmlinux $STUB_PATCH_PATH/kernel

  cp build.sh $STUB_PATH/build.sh
  #Save build command info
  echo "Build as $LOCAL_KERNEL_PATH"                                                                   >> $STUB_PATH/build_cmd_info.txt
  echo "uboot:   ./make.sh $UBOOT_DEFCONFIG"                                                           >> $STUB_PATH/build_cmd_info.txt
  echo "kernel:  make ARCH=$KERNEL_ARCH $KERNEL_DEFCONFIG && make ARCH=$KERNEL_ARCH $KERNEL_DTS.img"   >> $STUB_PATH/build_cmd_info.txt
  echo "android: lunch $TARGET_PRODUCT-$BUILD_VARIANT && make installclean && make"                    >> $STUB_PATH/build_cmd_info.txt
  echo "version: $SDK_VERSION"                                                                         >> $STUB_PATH/build_cmd_info.txt
  echo "finger:  $BUILD_ID/$BUILD_NUMBER/$BUILD_VARIANT"                                               >> $STUB_PATH/build_cmd_info.txt
fi

#######################################################################################################################################
# cleanall
if [ "$BUILD_CLEANALL" = true ] ; then
#  find -name ".svn" -exec rm -rf {} \;
#  find -name ".repo" -exec rm -rf {} \;
#  find -name ".git*" -exec rm -rf {} \;
#  find -name ".mailmap" -exec rm -rf {} \;
#  find -name ".Socs" -exec rm -rf {} \;
#  find -name ".clang-format" -exec rm -rf {} \;
#  rm -rf ${TOP_DIR}/RKDocs
#  rm -rf ${TOP_DIR}/BUILD
#  rm -rf ${TOP_DIR}/RKTools/windows
#  rm -rf ${TOP_DIR}/RKTools/mac
#  rm -rf ${TOP_DIR}/RKTools/linux/Linux_AttestationKeyboxPack_Tool.rar
#  rm -rf ${TOP_DIR}/RKTools/linux/Linux_TA_Sign_Tool.rar
#  rm -rf ${TOP_DIR}/RKTools/linux/Linux_SecureBoot
#  rm -rf ${TOP_DIR}/prebuilts/android-emulator
#  mv ${TOP_DIR}/prebuilts/sdk/tools/darwin ${TOP_DIR}/
#  cd ${TOP_DIR}/prebuilts && find -name "*darwin*" -exec rm -rf {} \; && cd -
#  cd ${TOP_DIR}/prebuilts && find -name "*mips*" -exec rm -rf {} \; && cd -
#  cd ${TOP_DIR}/prebuilts && find -name "*mingw*" -exec rm -rf {} \; && cd -
#  mv ${TOP_DIR}/darwin ${TOP_DIR}/prebuilts/sdk/tools/

  echo "Cleaning wifi ......"
  ${TOP_DIR}/external/wifi_driver
  if [ -d ${TOP_DIR}/external/wifi_driver ]; then
    source ${TOP_DIR}/external/wifi_driver/set_android_version.sh ${TOP_DIR}/external/wifi_driver
    cd ${TOP_DIR}/external/wifi_driver && make $ADDON_ARGS ARCH=$KERNEL_ARCH -C ../../$LOCAL_KERNEL_PATH M=$PWD clean && cd -
  fi

  echo "Cleaning uboot ......"
  cd ${TOP_DIR}/u-boot && make distclean
  rm -rf ${TOP_DIR}/u-boot/bl31.elf
  rm -rf ${TOP_DIR}/u-boot/fit/
  rm -rf ${TOP_DIR}/u-boot/tools/bmp2gray16
  rm -rf ${TOP_DIR}/u-boot/tools/boot_merger
  rm -rf ${TOP_DIR}/u-boot/tools/loaderimage
  rm -rf ${TOP_DIR}/u-boot/tools/resource_tool
  rm -rf ${TOP_DIR}/u-boot/tools/trust_merger

  echo "Cleaning kernel ......"
  cd ${TOP_DIR}/${LOCAL_KERNEL_PATH} && make ARCH=arm64 distclean
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm/vdso/vdsomunge
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm64/boot/dts/rockchip/.*.domain
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm64/boot/dts/rockchip/*.tmp
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm64/boot/Image*
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm64/crypto/sha256-core.S
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm64/kernel/vdso/vdso.lds
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm64/kernel/vdso/vdso.so*
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm64/kernel/vmlinux.lds
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm64/kernel/vdso32/vdso.lds
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm64/kernel/vdso32/vdso.so*
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/arch/arm64/include/generated/
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/drivers/gpu/arm/mali400/mali/__malidrv_build_info.c
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/*.img
  rm -rf ${TOP_DIR}/${LOCAL_KERNEL_PATH}/.tmp*

  echo "Cleaning android ......"
  rm -rf ${TOP_DIR}/out
  rm -rf ${TOP_DIR}/BUILD

  echo "Cleaning others ......"
  rm -rf ${TOP_DIR}/.bootstrap
  rm -rf ${TOP_DIR}/rockdev
  rm -rf ${TOP_DIR}/RKTools/linux/Linux_Pack_Firmware/rockdev/package-file-tmp
  rm -rf ${TOP_DIR}/libOpenCL.so
  rm -rf ${TOP_DIR}/rkbin/idblock.img
fi

# sync
cd ${TOP_DIR}
END_TIME=`date +%s`
let "ELAPSED_TIME=($END_TIME-$START_TIME)/60+1"
echo -n "${color_success}Total compile time is $ELAPSED_TIME minutes "
echo " ${color_reset}"
exit 0
