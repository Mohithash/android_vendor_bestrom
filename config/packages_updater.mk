# BestROM: always ship Updater for bestrom_% (UNOFFICIAL-safe)
ifneq ($(filter bestrom_%,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    Updater
endif
