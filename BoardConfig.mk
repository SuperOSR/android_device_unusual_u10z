# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

include device/unusual/sun6i-common/BoardConfigCommon.mk

BOARD_KERNEL_CMDLINE += ion_reserve=256M

#recovery
TARGET_RECOVERY_UI_LIB := librecovery_ui_u10z
SW_BOARD_TOUCH_RECOVERY :=true
SW_BOARD_RECOVERY_CHAR_HEIGHT := 60
SW_BOARD_RECOVERY_CHAR_WIDTH  := 25
#/bootloader/recovery/minui/roboto_23x41.h,chose for change font size
SW_BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

# 1. broadcom wifi support
BOARD_WIFI_VENDOR := broadcom
ifeq ($(BOARD_WIFI_VENDOR), broadcom)
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
    BOARD_HOSTAPD_DRIVER := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
    BOARD_WLAN_DEVICE           := bcmdhd
    WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"

    SW_BOARD_USR_WIFI := AP6210
    
    WIFI_DRIVER_FW_PATH_STA := "/system/vendor/modules/fw_bcm40181a2.bin"
    WIFI_DRIVER_FW_PATH_P2P := "/system/vendor/modules/fw_bcm40181a2_p2p.bin"
    WIFI_DRIVER_FW_PATH_AP  := "/system/vendor/modules/fw_bcm40181a2_apsta.bin"
endif
    
#2.Bluetooth Configuration
    #make sure BOARD_HAVE_BLUETOOTH is true for every bt vendor
    BOARD_HAVE_BLUETOOTH := true
    BOARD_HAVE_BLUETOOTH_BCM := true
    SW_BOARD_HAVE_BLUETOOTH_NAME := ap6210
    BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/unusual/u10z/bluetooth/
