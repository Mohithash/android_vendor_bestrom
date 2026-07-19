ifneq ($(wildcard device/qcom/sepolicy_vndr/SEPolicy.mk),)
include device/qcom/sepolicy_vndr/SEPolicy.mk
else ifneq ($(wildcard device/qcom/sepolicy/SEPolicy.mk),)
include device/qcom/sepolicy/SEPolicy.mk
endif
