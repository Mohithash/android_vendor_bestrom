# BestROM common product — pure AOSP 17, monochrome, battery-first
# Graphene-style thin product layer (NOT Evolution X skins)

PRODUCT_BRAND ?= BestROM
PRODUCT_COMPANY ?= BestROM
PRODUCT_MODEL ?= BestROM
PRODUCT_MANUFACTURER ?= BestROM

BESTROM_BUILD_TYPE ?= UNOFFICIAL

$(call inherit-product-if-exists, vendor/bestrom/config/version.mk)
$(call inherit-product-if-exists, vendor/bestrom/config/packages.mk)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.software.version=BestROM \
    ro.product.system.brand=BestROM \
    ro.bestrom.ui.theme=dark \
    ro.bestrom.ui.theme.default=dark \
    ro.bestrom.ui.battery_first=1 \
    ro.bestrom.ui.canvas=black \
    ro.bestrom.ui.pure_dark=1 \
    ro.bestrom.ui.monochrome=1 \
    ro.bestrom.ui.palette=black_grey \
    ro.carrier=unknown \
    ro.com.android.dataroaming=false \
    ro.storage_manager.enabled=true \
    persist.sys.disable_rescue=true

PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.ui_night_mode=2

ifeq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.strictmode.disable=true
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += log.tag=I
endif

PRODUCT_PACKAGE_OVERLAYS += vendor/bestrom/overlay

PRODUCT_COPY_FILES += \
    vendor/bestrom/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/bestrom/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions

PRODUCT_COPY_FILES += \
    vendor/bestrom/prebuilt/common/etc/permissions/privapp-permissions-bestrom.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-bestrom.xml

ifneq ($(wildcard vendor/bestrom/prebuilt/common/media/bestrom-amoled.jpg),)
PRODUCT_COPY_FILES += \
    vendor/bestrom/prebuilt/common/media/bestrom-amoled.jpg:$(TARGET_COPY_OUT_PRODUCT)/media/wallpaper/default_wallpaper.jpg
endif

ifneq ($(wildcard vendor/bestrom/prebuilt/common/media/bootanimation.zip),)
PRODUCT_COPY_FILES += \
    vendor/bestrom/prebuilt/common/media/bootanimation.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

-include vendor/bestrom-priv/keys/keys.mk

TARGET_BOOT_ANIMATION_RES ?= 1080

include vendor/bestrom/build/tasks/bacon.mk
