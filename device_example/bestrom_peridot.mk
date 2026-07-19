$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, vendor/bestrom/config/common_full_phone.mk)

PRODUCT_NAME := bestrom_peridot
PRODUCT_DEVICE := peridot
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 24069PC21G
PRODUCT_MANUFACTURER := Xiaomi
