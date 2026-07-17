# BestROM common product configuration
# Inherit this from device product makefiles (bestrom_*.mk)

$(call inherit-product-if-exists, vendor/bestrom/config/version.mk)

# Branding
PRODUCT_BRAND ?= BestROM
PRODUCT_COMPANY ?= BestROM
PRODUCT_MANUFACTURER ?= BestROM

# Build props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.software.version=BestROM \
    ro.product.system.manufacturer=BestROM

# Optional: keep VoltageOS/AOSP common if present when basing on Voltage
# $(call inherit-product-if-exists, vendor/voltage/config/common_full_phone.mk)

# Packages BestROM may add later
PRODUCT_PACKAGES += \
    LatinIME

# Boot animation resolution (override per device)
TARGET_BOOT_ANIMATION_RES ?= 1080

# Allow missing deps during early bring-up (disable for release)
# BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
