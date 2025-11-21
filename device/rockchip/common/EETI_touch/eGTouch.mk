PRODUCT_COPY_FILES += \
    device/rockchip/common/EETI_touch/eGTouchA.ini:system/etc/eGTouchA.ini \
    device/rockchip/common/EETI_touch/eGalaxTouch_VirtualDevice.idc:system/usr/idc/eGalaxTouch_VirtualDevice.idc \
    device/rockchip/common/EETI_touch/egtouch.sh:system/bin/egtouch.sh

ifeq ($(TARGET_ARCH),arm)
  PRODUCT_COPY_FILES += device/rockchip/common/EETI_touch/eGTouchD_32:system/bin/eGTouchD
else ifeq ($(TARGET_ARCH),arm64)
  PRODUCT_COPY_FILES += device/rockchip/common/EETI_touch/eGTouchD_64:system/bin/eGTouchD
endif
