.PHONY: bacon
bacon: otapackage
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) \
	  $(PRODUCT_OUT)/BestROM-$(BESTROM_VERSION)-$(BESTROM_BUILD_DATE)-$(TARGET_DEVICE)-$(BESTROM_BUILD_TYPE).zip 2>/dev/null || true
	$(hide) echo "Package Complete: $(PRODUCT_OUT)/BestROM-*.zip"
