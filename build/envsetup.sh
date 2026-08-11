# BestROM envsetup helpers
# Usage: source vendor/bestrom/build/envsetup.sh

function bestrom_breakfast() {
    local target=$1
    local variant=${2:-user}
    source "${ANDROID_BUILD_TOP}/vendor/voltage/vars/aosp_target_release"
    if [ -z "$target" ]; then
        lunch
        return $?
    fi
    if [[ "$target" =~ -(user|userdebug|eng)$ ]]; then
        lunch "$target"
    else
        lunch "bestrom_${target}-${aosp_target_release}-${variant}"
    fi
}

function bestrom_brunch() {
    bestrom_breakfast "$@"
    # bestrom_zip = bacon + BestROM-named publish (see build/tasks/bestrom_post.mk)
    # plain `mka bacon` also publishes via bestrom-post-bacon hook in bacon.mk
    [ $? -eq 0 ] && mka bestrom_zip
}

alias bbreakfast=bestrom_breakfast
alias bbrunch=bestrom_brunch

echo "BestROM: use  lunch bestrom_peridot-bp4a-user  or  bestrom_breakfast peridot"
