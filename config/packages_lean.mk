# BestROM lean package set
# SPDX-License-Identifier: Apache-2.0
#
# Primary gate: vendor/voltage/config/packages.mk skips optional packages when
# TARGET_PRODUCT matches bestrom_%. (Product-node list vars are merged from all
# inherited nodes; filter-out in a child node cannot strip parent contributions.)
#
# KEEP (always added in packages.mk):
#   LMOFreeform, LMOFreeformSidebar, LogViewer, Datura, Jellyfish,
#   AppDataBackup, GameSpace, MiXplorer
#
# REMOVE for bestrom_* (gated in packages.mk):
#   VoltageJump, Covers, OmniJaws, talkback, Gramophone
#   UdfpsIcons, UdfpsAnimations (EXTRA_UDFPS_ANIMATIONS := false for bestrom)
#   ViPER4AndroidFX, libv4a_re (not inherited; listed for safety)
#
# Defense-in-depth: if any of the remove list is added in *this* product node
# (or via include in the same node), strip it here too.

ifneq ($(filter bestrom_%,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES := $(filter-out \
    VoltageJump \
    Covers \
    OmniJaws \
    talkback \
    Gramophone \
    UdfpsIcons \
    UdfpsAnimations \
    ViPER4AndroidFX \
    libv4a_re \
    ,$(PRODUCT_PACKAGES))
endif
