# BestROM vendor

BestROM product configuration for Android 16 · device **peridot** (POCO F6).

Includes lean package filter (`config/packages_lean.mk`) for bestrom_* products.

## Build

```bash
source build/envsetup.sh
source vendor/bestrom/build/envsetup.sh
lunch bestrom_peridot-bp4a-user
mka bacon -j$(nproc)
```

## Output

- `BestROM-A16-peridot-YYYYMMDD-HHMM-*.zip`
- Archive: `~/voltage_artifacts/BestROM/`

## Policy

- Product name: BestROM
- Device fingerprint: stock POCO HyperOS-compatible identity (device makefile)
- No custom brand props in release images
- Lean removes: VoltageJump, Covers, OmniJaws, talkback, Gramophone, UdfpsIcons, UdfpsAnimations, ViPER4AndroidFX, libv4a_re
