# source after build/envsetup.sh
function bestrom_lunch() {
  local d=${1:-peridot}
  local v=${2:-userdebug}
  lunch bestrom_${d}-trunk_staging-${v} \
    || lunch bestrom_${d}-cp2a-${v} \
    || lunch bestrom_${d}-bp2a-${v} \
    || lunch bestrom_${d}-${v} \
    || echo "lunch failed — check AndroidProducts.mk / build/release"
}
function bestrom_brunch() {
  bestrom_lunch "$@"
  m bacon -j"$(nproc 2>/dev/null || echo 8)"
}
echo "BestROM: bestrom_lunch [device] [variant] · bestrom_brunch [device]"
