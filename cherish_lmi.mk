#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/xiaomi/lmi/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cherish/config/common_full_phone.mk)

$(call inherit-product, vendor/gms/gms_pico1.mk)


# Set Boot Animination Resolution
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_NAME := cherish_lmi
PRODUCT_DEVICE := lmi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := POCO
PRODUCT_MODEL := POCO F2 Pro


# GAPPS

CHERISH_VANILLA := true
#TARGET_USES_PICO_GAPPS := true
#TARGET_USES_MINI_GAPPS := true
TARGET_FACE_UNLOCK_SUPPORTED := true
EXTRA_UDFPS_ANIMATIONS := true
TARGET_INCLUDE_LIVE_WALLPAPERS := false
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_GOOGLE_RECORDER := false
CHERISH_MAINTAINER := alexeei
CHERISH_CHIPSET := SM8250
CHERISH_BATTERY := 4700mAh
CHERISH_DISPLAY := 1080x2400
CHERISH_BUILD_TYPE=OFFICIAL
#WITH_GAPPS := true

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Redmi/lmi/lmi:12/RKQ1.211001.001/V13.0.6.0.SJKCNXM:user/release-keys

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="lmi-user 12 RKQ1.211001.001 V13.0.6.0.SJKCNXM release-keys"

