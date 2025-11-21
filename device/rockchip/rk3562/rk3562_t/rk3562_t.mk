#
# Copyright 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# First lunching is T, api_level is 33
PRODUCT_SHIPPING_API_LEVEL := 33
PRODUCT_DTBO_TEMPLATE := $(LOCAL_PATH)/dt-overlay.in
PRODUCT_SDMMC_DEVICE := ff880000.mmc

include device/rockchip/common/build/rockchip/DynamicPartitions.mk
include device/rockchip/rk3562/rk3562_t/BoardConfig.mk
include device/rockchip/common/BoardConfig.mk
$(call inherit-product, device/rockchip/rk3562/device.mk)
$(call inherit-product, device/rockchip/common/device.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/../overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_NAME := rk3562_t
PRODUCT_DEVICE := rk3562_t
PRODUCT_BRAND := rockchip
PRODUCT_MODEL := INTRETECH_DEVICE
PRODUCT_MANUFACTURER := INTRETECH
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_AAPT_CONFIG := mdpi xlarge hdpi xhdpi large ldpi

## add Rockchip properties
#
PRODUCT_PROPERTY_OVERRIDES += ro.vendor.hdmirotationlock=true
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.dex2oat64.enabled=true

PRODUCT_PACKAGES += BaiduSpeechService
PRODUCT_PACKAGES += rkCamera2_h
PRODUCT_PACKAGES += hard_test

PRODUCT_PROPERTY_OVERRIDES += \
  ro.surface_flinger.primary_display_orientation=ORIENTATION_0 \
  ro.input_flinger.primary_touch.rotation=0 \
  ro.minui.default_rotation=ROTATION_NONE

#PRODUCT_PROPERTY_OVERRIDES += \
#  ro.surface_flinger.primary_display_orientation=ORIENTATION_90 \
#  ro.input_flinger.primary_touch.rotation=90 \
#  ro.minui.default_rotation=ROTATION_RIGHT

#PRODUCT_PROPERTY_OVERRIDES += \
#  ro.surface_flinger.primary_display_orientation=ORIENTATION_180 \
#  ro.input_flinger.primary_touch.rotation=180 \
#  ro.minui.default_rotation=ROTATION_DOWN

#PRODUCT_PROPERTY_OVERRIDES += \
#  ro.surface_flinger.primary_display_orientation=ORIENTATION_270 \
#  ro.input_flinger.primary_touch.rotation=270 \
#  ro.minui.default_rotation=ROTATION_LEFT

PRODUCT_PROPERTY_OVERRIDES += \
  ro.adb.secure=0 \
  ro.debuggable=1 \
  sys.adb_enable=1 \
  ro.control_privapp_permissions=log \
  persist.sys.adoptable=force_off \
  keyguard.no_require_sim=true \
  ro.com.android.dataroaming=true \
  ril.function.dataonly=1 \
  nfc.debug_enabled=0

PRODUCT_PROPERTY_OVERRIDES += \
  config.disable_bluetooth=false \
  config.disable_gps=false \
  persist.adb.tls_server.enable=1 \
  persist.net.priority=0 \
  persist.sys.launcher=com.android.launcher3 \
  persist.wifi.sleep.delay.ms=0 \
  persist.bt.power.down=true \
  persist.sys.forced_orient=0 \
  persist.sys.def_hidenavigation=0 \
  persist.sys.def_hidestatusbar=0 \
  persist.sys.uvc_orientation=0 \
  persist.sys.uvc_noext=1 \
  persist.sys.spk_force=1 \
  persist.sys.timezone=Asia/Shanghai \
  persist.sys.country=Hans-CN \
  persist.sys.language=zh \
  persist.sys.poweroff_time=0 \
  persist.sys.poweron_time=0 \
  persist.net.eth0.mode=0 \
  persist.net.eth0.ip=192.168.1.200/24 \
  persist.net.eth0.gateway=192.168.1.1 \
  persist.net.eth0.dns=192.168.1.1 \
  persist.net.eth1.mode=0 \
  persist.net.eth1.ip=192.168.2.200/24 \
  persist.net.eth1.gateway=192.168.2.1 \
  persist.net.eth1.dns=192.168.2.1 \
  persist.net.eth.Tether=0 \
  persist.net.eth.TetherIP=192.168.1.1/24 \
  persist.sys.show_volumebutton=1 \
  persist.sys.show_powerbutton=1 \
  persist.sys.show_rotatebutton=0 \
  ro.audio.flinger_standbytime_ms=3000 \
  ro.wifi.sleep.power.down=true \
  persist.sys.eint_density=240 \
  ro.sf.lcd_density=240 \
  vendor.audio.rk_denoise=1 \
  vendor.hwc.device.primary=LVDS \
  vendor.hwc.device.extend=HDMI-A,eDP \
  sys.mouse.presentation=1 \
  sys.def_screen_brightness=200 \
  sys.def_develop_enable=1 \
  sys.def_powerkey_long=1 \
  sys.def_wifi_ssid=PEITE-WIFI-WORK \
  sys.def_wifi_pass=peite-13579 \
  sys.def_voice_service=com.baidu.duersdk.opensdk/.service.DuerCoreSpeechRecognitionService \
  sys.def_tts_synth=com.baidu.duersdk.opensdk \
  sys.gps.quectel=1 \
  sys.def_wifi_on=0 \
  sys.def_bluetooth_on=0 \
  sys.def_charging_sound=0 \
  sys.ota_disable_auto_update=1 \
  sys.def_ntp_server=ntp.aliyun.com \
  sys.def_ntp_timeout=10000 \
  sys.def_screen_off_timeout=0 \
  sys.def_volume_music=15 \
  sys.def_volume_ring=7 \
  sys.def_volume_system=7 \
  sys.def_volume_voicecall=5 \
  sys.def_volume_alarm=7 \
  sys.def_volume_notification=7 \
  sys.def_volume_bluetoothsoc=15 \
  sys.mobile_data_always_on=1 \
  sys.wifi_display_certification=1 \
  sys.wifi_wakeup_enable=1 \
  sys.wifi_scan_always_available=1 \
  sys.def_no_deepsleep=1 \
  sys.def_nightmode=2 \
  sys.def_usbaudio_disable=1 \
  sys.def_nobtpairing=1
