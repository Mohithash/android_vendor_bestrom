# Release keys (private)

BestROM production builds use **distinct** `vendor/voltage-priv/keys/releasekey`
(`PRODUCT_DEFAULT_DEV_CERTIFICATE`), **not** the public AOSP/testkey material.

**Never commit** `*.pk8` private keys to public GitHub.
Generate on the builder:

```bash
cd vendor/voltage-priv/keys
# development/tools/make_key releasekey '/C=US/...'
```

Channel: `BESTROM_BUILD_TYPE=OFFICIAL` (BestROM-owned; skips Voltage GPG list).
