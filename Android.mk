LOCAL_PATH := $(call my-dir)

ifneq ($(filter u10z,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
