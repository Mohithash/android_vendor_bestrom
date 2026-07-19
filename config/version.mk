# BestROM version — pure AOSP 17 monochrome
BESTROM_VERSION := 17.0
BESTROM_CODENAME := MonochromeNight
BESTROM_BUILD_DATE := $(shell date -u +%Y%m%d)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.bestrom.version=$(BESTROM_VERSION) \
    ro.bestrom.codename=$(BESTROM_CODENAME) \
    ro.bestrom.build.date=$(BESTROM_BUILD_DATE) \
    ro.bestrom.releasetype=$(BESTROM_BUILD_TYPE) \
    ro.modversion=BestROM-$(BESTROM_VERSION)

PRODUCT_SYSTEM_NAME := bestrom
PRODUCT_SYSTEM_DEVICE := generic
