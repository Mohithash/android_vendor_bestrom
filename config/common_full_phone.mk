# BestROM full phone product
# SPDX-License-Identifier: Apache-2.0

$(call inherit-product, vendor/bestrom/config/common.mk)

# Platform feature set (telephony / packages / framework extras)
# BestROM lean: disable UDFPS animation packages before voltage packages.mk
EXTRA_UDFPS_ANIMATIONS := false

$(call inherit-product, vendor/voltage/config/common_full_phone.mk)

# Lean package filter (BestROM thrift)
$(call inherit-product, vendor/bestrom/config/packages_lean.mk)

# --- Zip naming (BestROM primary / voltage secondary) ---
# vendor/voltage/config/version.mk hard-assigns VOLTAGEVERSION / VOLTAGE_VERSION.
# Re-stamp only for bestrom_* products so bacon's secondary voltage-*.zip uses the
# BestROM version stem, while primary public name is BestROM-A16-... via bestrom_post.
# voltage_peridot does not inherit this file — left unchanged.
ifneq ($(filter bestrom_%,$(TARGET_PRODUCT)),)
  VOLTAGEVERSION := $(BESTROMVERSION)
  VOLTAGE_BUILD := $(BESTROM_DEVICE_SHORT)
  VOLTAGE_BUILD_TYPE := $(BESTROM_BUILD_TYPE)
  # Recompute version string used by bacon.mk → voltage-$(VOLTAGE_VERSION).zip
  VOLTAGE_VERSION := $(BESTROMVERSION)-$(BESTROM_DEVICE_SHORT)-$(VOLTAGE_BUILD_DATE)-$(BESTROM_BUILD_TYPE)
  VOLTAGE_DISPLAY_VERSION := $(BESTROM_DISPLAY_VERSION)
  VOLTAGE_DISPLAY_BUILDTYPE := $(BESTROM_BUILD_TYPE)
  VOLTAGE_FINGERPRINT := BestROM/$(ANDROID_VERSION)-$(BESTROMVERSION)/$(BESTROM_DEVICE_SHORT)/$(VOLTAGE_BUILD_DATE)
  # Align BestROM date stamp with voltage date so stems match
  BESTROM_BUILD_DATE := $(VOLTAGE_BUILD_DATE)
  BESTROM_ZIP_STEM := BestROM-A$(BESTROM_ANDROID)-$(BESTROM_DEVICE_SHORT)-$(BESTROM_BUILD_DATE)-$(BESTROM_BUILD_TYPE)
endif

# flash_08_ota
$(call inherit-product-if-exists, vendor/bestrom/config/packages_updater.mk)

# BESTROM_FORCE_OFFICIAL: channel stamp + zip type (product-owned, not Voltage GPG)
BESTROM_BUILD_TYPE := OFFICIAL
VOLTAGE_BUILD_TYPE := OFFICIAL
VOLTAGE_DISPLAY_BUILDTYPE := OFFICIAL
