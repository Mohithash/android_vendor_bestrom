# BestROM common configuration
# SPDX-License-Identifier: Apache-2.0

BESTROM_ANDROID := 16
BESTROMVERSION ?= 1.0
BESTROM_BUILD_TYPE ?= OFFICIAL

# Pinned BESTROM_* dates via voltage build_stamp.mk
ifndef BESTROM_DATE_YEAR
include vendor/voltage/config/build_stamp.mk
endif
BESTROM_BUILD_DATE := $(BESTROM_DATE_YEAR)$(BESTROM_DATE_MONTH)$(BESTROM_DATE_DAY)-$(BESTROM_DATE_HOUR)$(BESTROM_DATE_MINUTE)

BESTROM_DEVICE_SHORT := $(subst bestrom_,,$(TARGET_PRODUCT))
ifeq ($(BESTROM_DEVICE_SHORT),$(TARGET_PRODUCT))
  BESTROM_DEVICE_SHORT := $(TARGET_DEVICE)
endif

BESTROM_ZIP_STEM := BestROM-A$(BESTROM_ANDROID)-$(BESTROM_DEVICE_SHORT)-$(BESTROM_BUILD_DATE)-$(BESTROM_BUILD_TYPE)
BESTROM_DISPLAY_VERSION := BestROM $(BESTROMVERSION)
BESTROM_VERSION_STRING := $(BESTROMVERSION)-$(BESTROM_DEVICE_SHORT)-$(BESTROM_BUILD_DATE)-$(BESTROM_BUILD_TYPE)

# Pre-align platform zip variables (version.mk may overwrite VOLTAGEVERSION with :=).
# Final restamp for bestrom_* happens in common_full_phone.mk *after* voltage inherit.
VOLTAGE_BUILD_TYPE := $(BESTROM_BUILD_TYPE)
VOLTAGEVERSION := $(BESTROMVERSION)
VOLTAGE_BUILD := $(BESTROM_DEVICE_SHORT)
VOLTAGE_DISPLAY_VERSION := $(BESTROM_DISPLAY_VERSION)

# Stock identity only — never emit custom brand props by default
# (BESTROM_EMIT_IDENTITY_PROPS=true is opt-in debug only)

# UI string package for About / branding
PRODUCT_PACKAGE_OVERLAYS += vendor/bestrom/overlay/common

# Boot animation already under vendor/voltage/bootanimation (BestROM assets)
TARGET_BOOT_ANIMATION_RES ?= 2560

# flash_08_ota
$(call inherit-product-if-exists, vendor/bestrom/config/packages_updater.mk)
