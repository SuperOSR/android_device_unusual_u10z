$(call inherit-product, device/unusual/sun6i-common/sun6i-common.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/unusual/u10z/u10z-vendor.mk)
$(call inherit-product-if-exists, vendor/osr/config/full_tablet.mk)

# init.rc, kernel
PRODUCT_COPY_FILES += \
	device/unusual/u10z/kernel:kernel \
	device/unusual/u10z/modules/modules/nand.ko:root/nand.ko \
	device/unusual/u10z/init.sun6i.rc:root/init.sun6i.rc \
	device/unusual/u10z/ueventd.sun6i.rc:root/ueventd.sun6i.rc \
	device/unusual/u10z/initlogo.rle:root/initlogo.rle  \
	device/unusual/u10z/fstab.sun6i:root/fstab.sun6i \
	device/unusual/u10z/media/bootanimation.zip:system/media/bootanimation.zip \
	device/unusual/u10z/media/bootlogo.bmp:system/media/bootlogo.bmp \
	device/unusual/u10z/init.recovery.sun6i.rc:root/init.recovery.sun6i.rc

# wifi features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml

#ap6210 sdio wifi fw and nvram
PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/firmware/ap6210/fw_bcm40181a2.bin:system/vendor/modules/fw_bcm40181a2.bin \
    hardware/broadcom/wlan/firmware/ap6210/fw_bcm40181a2_apsta.bin:system/vendor/modules/fw_bcm40181a2_apsta.bin \
    hardware/broadcom/wlan/firmware/ap6210/fw_bcm40181a2_p2p.bin:system/vendor/modules/fw_bcm40181a2_p2p.bin \
    hardware/broadcom/wlan/firmware/ap6210/nvram_ap6210.txt:system/vendor/modules/nvram_ap6210.txt \
    hardware/broadcom/wlan/firmware/ap6210/bcm20710a1.hcd:system/vendor/modules/bcm20710a1.hcd

# GPU buffer size configs
PRODUCT_COPY_FILES += \
        device/unusual/u10z/configs/powervr.ini:system/etc/powervr.ini

#key and tp config file
PRODUCT_COPY_FILES += \
	device/unusual/u10z/configs/sw-keyboard.kl:system/usr/keylayout/sw-keyboard.kl \
	device/unusual/u10z/configs/tp.idc:system/usr/idc/tp.idc \
	device/unusual/u10z/configs/gsensor.cfg:system/usr/gsensor.cfg

#copy touch and keyboard driver to recovery ramdisk
PRODUCT_COPY_FILES += \
  device/unusual/u10z/modules/modules/gt927.ko:obj/touch.ko \
  device/unusual/u10z/modules/modules/sw-keyboard.ko:obj/keyboard.ko \
  device/unusual/u10z/modules/modules/disp.ko:obj/disp.ko \
  device/unusual/u10z/modules/modules/lcd.ko:obj/lcd.ko \
  device/unusual/u10z/modules/modules/hdmi.ko:obj/hdmi.ko

#vold config
PRODUCT_COPY_FILES += \
   device/unusual/u10z/vold.fstab:system/etc/vold.fstab \
   device/unusual/u10z/recovery.fstab:recovery.fstab
   
# camera
PRODUCT_COPY_FILES += \
	device/unusual/u10z/configs/camera.cfg:system/etc/camera.cfg \
	device/unusual/u10z/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/unusual/u10z/configs/cfg-AWGallery.xml:system/etc/cfg-AWGallery.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml

# 3G Data Card Packages
PRODUCT_PACKAGES += \
	u3gmonitor \
	chat \
	rild \
	pppd

# 3G Data Card Configuration Flie
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/usiuna-ril.so:system/lib/usiuna-ril.so \
	$(LOCAL_PATH)/ppp/chat:system/bin/chat \
	$(LOCAL_PATH)/ppp/call-pppd:system/etc/ppp/call-pppd \
	$(LOCAL_PATH)/ppp/ttyusb-scan:system/bin/ttyusb-scan \
	device/unusual/sun6i-common/rild/ip-down:system/etc/ppp/ip-down \
	device/unusual/sun6i-common/rild/ip-up:system/etc/ppp/ip-up \
	device/unusual/sun6i-common/rild/call-pppd:system/etc/ppp/call-pppd-aw \
	device/unusual/sun6i-common/rild/3g_dongle.cfg:system/etc/3g_dongle.cfg \
	device/unusual/sun6i-common/rild/usb_modeswitch:system/bin/usb_modeswitch \
	device/unusual/sun6i-common/rild/call-pppd:system/xbin/call-pppd \
	device/unusual/sun6i-common/rild/usb_modeswitch.sh:system/xbin/usb_modeswitch.sh \
	device/unusual/u10z/apns-conf.xml:system/etc/apns-conf.xml \
	$(LOCAL_PATH)/ppp/ip-up-vpn:system/etc/ppp/ip-up-vpn \
	$(LOCAL_PATH)/spn-conf.xml:system/etc/spn-conf.xml \
	$(LOCAL_PATH)/ppp/plmnlist:system/etc/ppp/plmnlist  \
	device/unusual/sun6i-common/rild/libsoftwinner-ril.so:system/lib/libsoftwinner-ril.so

# 3G Data Card usb modeswitch File
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/unusual/sun6i-common/rild/usb_modeswitch.d,system/etc/usb_modeswitch.d)

#4KPlayer
PRODUCT_COPY_FILES += \
       device/unusual/u10z/configs/cfg-fourkplayer.xml:system/etc/cfg-fourkplayer.xml

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=Europe/Madrid \
	persist.sys.language=es \
	persist.sys.country=ES
	
PRODUCT_PROPERTY_OVERRIDES += \
	ro.hwa.force=true

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage,adb \
	ro.udisk.lable=U10Z \
	ro.font.scale=1.0 

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320 \
	persist.service.adb.enable=0 \
	ro.product.firmware=v3.2
	

$(call inherit-product-if-exists, device/unusual/u10z/modules/modules.mk)

DEVICE_PACKAGE_OVERLAYS := device/unusual/u10z/overlay
PRODUCT_CHARACTERISTICS := tablet

# Overrides
PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi large
PRODUCT_AAPT_PREF_CONFIG := xhdpi

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := u10z
PRODUCT_NAME := osr_u10z
PRODUCT_BRAND := unusual
PRODUCT_MODEL := u10z
PRODUCT_MANUFACTURER := Unusual
