PRODUCT_PACKAGES += \
  android.hardware.gnss@1.0-service \
  android.hardware.gnss@1.0-impl

PRODUCT_COPY_FILES += device/rockchip/common/quectel/libgps/gps_cfg.inf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps_cfg.inf
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.location.gps.xml

PRODUCT_PROPERTY_OVERRIDES += ro.hardware.gps.quectel=gzpeite

DEVICE_MANIFEST_FILE += device/rockchip/common/quectel/libgps/manifest_gps.xml

ifeq ($(TARGET_ARCH),arm)
  PRODUCT_COPY_FILES += device/rockchip/common/quectel/libgps/armeabi-v7a/gps.default.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/gps.quectel.gzpeite.so
else ifeq ($(TARGET_ARCH),arm64)
  PRODUCT_COPY_FILES += device/rockchip/common/quectel/libgps/arm64-v8a/gps.default.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/gps.quectel.gzpeite.so
endif
