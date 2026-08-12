# BestROM OTA catalog notes (flash_08)
# SPDX-License-Identifier: Apache-2.0
#
# Client URL (Updater overlay):
#   https://raw.githubusercontent.com/Mohithash/bestrom_ota/16/{device}.json
# Live placeholder:
#   https://raw.githubusercontent.com/Mohithash/bestrom_ota/16/peridot.json
# Download path (Updater overlay):
#   /data/bestrom_updates/
#
# packages_updater.mk always ships Updater for bestrom_%.
# String overrides live in:
#   overlay/common/packages/apps/Updater/res/values/strings.xml
#
# No ro.* identity props here (detection-free policy).
