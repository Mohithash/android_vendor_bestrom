# BestROM — Vendor

Vendor config and branding for **BestROM**, an AOSP-based custom ROM.

Primary target: **Xiaomi POCO F6 / Redmi Turbo 3 (`peridot`)**

## Layout

```
config/common.mk     # common product inherit
config/version.mk    # versioning
config/BoardConfigBestROM.mk
build/envsetup.sh    # brunch/breakfast helpers (optional)
```

## Use with VoltageOS base (recommended)

```bash
repo init -u https://github.com/VoltageOS/manifest.git -b 16.2 --git-lfs
# add local_manifest from bestrom_manifest
repo sync -c -j$(nproc)
. build/envsetup.sh
source vendor/bestrom/build/envsetup.sh   # optional
breakfast peridot   # or: lunch bestrom_peridot-user
mka bacon
```

Product makefile lives with the device tree as `bestrom_peridot.mk` (see bestrom-project docs).
