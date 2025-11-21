PRODUCT_PACKAGES += \
  CarrierDefaultApp \
  CarrierConfig \
  rild \
  libquectel-ril

DISABLE_RILD_OEM_HOOK := true

# PRODUCT_COPY_FILES += device/rockchip/common/quectel/librild/apns-conf_sdk.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml
PRODUCT_COPY_FILES += device/rockchip/common/quectel/librild/apns-conf_sdk.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += device/rockchip/common/quectel/librild/ql-ril.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/ql-ril.conf

PRODUCT_PACKAGES += \
	android.hardware.radio@1.5-radio-service \
  android.hardware.radio.config@1.2-service

PRODUCT_PROPERTY_OVERRIDES += \
  ro.boot.noril=false \
  keyguard.no_require_sim=true \
  ro.com.android.dataroaming=true \
  ro.telephony.default_network=9

DEVICE_MANIFEST_FILE += device/rockchip/common/quectel/librild/manifest_ril.xml

ifeq ($(strip $(TARGET_ARCH)), arm64)
  PRODUCT_PROPERTY_OVERRIDES += vendor.rild.libpath=/vendor/lib64/libquectel-ril.so
else
  PRODUCT_PROPERTY_OVERRIDES += vendor.rild.libpath=/vendor/lib/libquectel-ril.so
endif
