LOCAL_PATH := $(my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := BaiduSpeechService
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_CLASS := APPS
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

LOCAL_PREBUILT_JNI_LIBS := \
  lib/armeabi/libbaidu_speech_grammar.dat.so \
  lib/armeabi/libBaiduSpeechSDK.so \
  lib/armeabi/libbd_easr_s1_merge_normal_20151216.dat.so \
  lib/armeabi/libbd_etts.so \
  lib/armeabi/libbdEASRAndroid.so \
  lib/armeabi/libBDSpeechDecoder_V1.so \
  lib/armeabi/libbdtts.so \
  lib/armeabi/libgnustl_shared.so \
  lib/armeabi/liblicense_baidu_duersdk_apk.data.so

LOCAL_MULTILIB :=32

include $(BUILD_PREBUILT)

