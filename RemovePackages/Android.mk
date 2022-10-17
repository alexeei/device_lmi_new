LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := \
    arcore \
    Chrome \
    Chrome-Stub \
    ConnMO \
    ConnMetrics \
    DCMO \
    DMService \
    DeskClock \
    ConnMetrics \
    GoogleTTS \
    Maps \
    MyVerizonServices \
    OPScreenRecord \
    Ornament \
    PixelBuds \
    PixelLiveWallpaperPrebuilt \
    RecorderPrebuilt \
    SCONE \
    ScribePrebuilt \
    Showcase \
    SoundAmplifierPrebuilt \
    SprintDM \
    SprintHM \
    GoogleCamera \
    Tycho \
    Via \
    Videos \
    VZWAPNLib \
    VzwOmaTrigger \
    YouTube \
    YouTubeMusicPrebuilt \
    Calculator \
    SafetyHubPrebuilt \
    AmbientSensePrebuilt \
    DevicePolicyPrebuilt \
    GCS \
    OBDM_Permissions \
    PartnerSetupPrebuilt \
    Showcase \
    Gallery2 \
    Drive \
    obdm_stub \
    Ornament \
    Videos \
    Video \
    ScribePrebuilt \
    Tycho \
    Velvet \
    Papers \
    Snap \
    SafetyHubPrebuilt \
    OdadPrebuilt \
    WellbeingPrebuilt \
    obdm_stub \
    Betterbug 
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
