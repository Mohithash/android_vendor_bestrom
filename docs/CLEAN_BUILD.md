# BestROM clean build notes (peridot A16)

## Source of truth (after 2026-08-12 clean success)

| Repo | Branch | Role |
|------|--------|------|
| Mohithash/device_xiaomi_peridot | vos-16.2-theettam | device + BTF flags |
| Mohithash/kernel_xiaomi_sm8635 | peridot-6.1.175 | SukiSU/SUSFS + lds + no-BTF modules |
| Mohithash/android_vendor_bestrom | 16 | product vendor |
| Mohithash/android_vendor_bestrom_platform | 16 | bacon/version/bootanim |
| Mohithash/packages_apps_Dialer | 16 | org.extdev SPN |
| Mohithash/vendor_lineage_compat | 16 | org.extdev SPN sources |
| Mohithash/bestrom_manifest | 16 | this local_manifest |

## Init / sync

```bash
# After normal VoltageOS 16.2 repo init:
mkdir -p .repo/local_manifests
curl -fsSL -o .repo/local_manifests/bestrom_peridot.xml \
  https://raw.githubusercontent.com/Mohithash/bestrom_manifest/16/local_manifest_peridot.xml
repo sync -c -j$(nproc)
```

## Lunch / bacon

```bash
source build/envsetup.sh
lunch bestrom_peridot-bp4a-user
mka bacon -j$(nproc)
```

## Kernel paper-overs already on GitHub (peridot-6.1.175)

Do **not** re-apply unless missing after sync:

1. `arch/arm64/kernel/vmlinux.lds.S` + `include/asm-generic/vmlinux.lds.h`
2. `CONFIG_DEBUG_INFO_BTF=n` / `CONFIG_DEBUG_INFO_BTF_MODULES=n` (defconfig + BoardConfig flags)
3. `scripts/Makefile.modfinal` no-op module BTF (`cmd_btf_ko = true`)

## Not on GitHub (by design)

- Full `out/` / zips (use artifacts or GitHub Releases)
- Private signing keys
- Optional `non_ab_ota.py` recovery banner (AOSP path)

## Last known good clean zip (ServerHive 2026-08-12)

- `voltage-5.11-EOL-peridot-20260811-2332-OFFICIAL.zip` / `bestrom_peridot-ota.zip` (~2.5G)
- SHA256: `010aa644bbba48c89bccd42c0f9b38a99cd5b1e8b539c0dcba62bea92dedb90e`
- Banner: BestROM · Theettam · SukiSU Ultra
