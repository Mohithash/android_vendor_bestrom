# BestROM env helpers — source after build/envsetup.sh
# Usage: source vendor/bestrom/build/envsetup.sh

function bestrom_lunch() {
  local device=${1:-peridot}
  local variant=${2:-user}
  lunch bestrom_${device}-${variant} 2>/dev/null \
    || lunch bestrom_${device}-bp2a-${variant} 2>/dev/null \
    || lunch bestrom_${device}-ap4a-${variant} 2>/dev/null \
    || echo "Could not lunch bestrom_${device}. Check AndroidProducts.mk"
}

function bestrom_brunch() {
  bestrom_lunch "$@"
  mka bacon
}

echo "BestROM helpers loaded: bestrom_lunch [device] [variant], bestrom_brunch [device]"
