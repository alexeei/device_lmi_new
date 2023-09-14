LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
    # AndroidAuto ##############################
#    AndroidAutoStubPrebuilt \
    # Arcore ###################################
#    arcore \
    # Browser ##################################
#    Chrome-Stub \
#    Chrome \
#    TrichromeLibrary-Stub \
#    TrichromeLibrary \
#    WebViewGoogle-Stub \
#    WebViewGoogle \
#    ScribePrebuilt \
    # Carrier ##################################
#    CarrierServices \
#    CarrierSetup \
    # Calculator ###############################
#    CalculatorGooglePrebuilt \
    # Calendar #################################
#    CalendarGooglePrebuilt \
    # Clock ####################################
#    PrebuiltDeskClockGoogle \
    # Device Personalization Services ##########
#    DevicePersonalizationPrebuiltPixel2021 \
#    GoogleExtServices \
    # Files ####################################
#    FilesPrebuilt \
#    DocumentsUIGoogle \
#    StorageManagerGoogle \
    # Flipendo #################################
#    Flipendo \
    # Google search ############################
#    Velvet \
    # Gmail ####################################
#    PrebuiltGmail \
    # Google Play ##############################
#    ConfigUpdater \
#    Phonesky \
#    PrebuiltGmsCore \
#    PrebuiltGmsCoreSc_AdsDynamite \
#    PrebuiltGmsCoreSc_CronetDynamite \
#    PrebuiltGmsCoreSc_DynamiteLoader \
#    PrebuiltGmsCoreSc_DynamiteModulesA \
#    PrebuiltGmsCoreSc_DynamiteModulesC \
#    PrebuiltGmsCoreSc_GoogleCertificates \
#    PrebuiltGmsCoreSc_MapsDynamite \
#    PrebuiltGmsCoreSc_MeasurementDynamite \
#    AndroidPlatformServices \
#    GoogleExtShared \
#    GoogleServicesFramework \
    # Intelligence #############################
#    DeviceIntelligenceNetworkPrebuilt \
#    SettingsIntelligenceGooglePrebuilt \
    # Keyboard #################################
#    LatinIMEGooglePrebuilt \
    # Location #################################
#    LocationHistoryPrebuilt \
    # ModuleMetadata ###########################
#    ModuleMetadataGoogle \
    # Overlays #################################
#    PixelBuiltInPrintService \
#    CaptivePortalLoginOverlay \
#    CellBroadcastReceiverOverlay \
#    CellBroadcastServiceOverlay \
#    PixelContactsProvider \
#    GoogleConfigOverlay \
#    GooglePermissionControllerOverlay \
#    GoogleWebViewOverlay \
#    ManagedProvisioningPixelOverlay \
#    NetworkStackOverlay \
#    PixelConfigOverlay2018 \
#    PixelConfigOverlay2019 \
#    PixelConfigOverlay2019Midyear \
#    PixelConfigOverlayCommon \
#    PixelConnectivityOverlay2021 \
#    PixelSetupWizardOverlay \
#    PixelSetupWizard__auto_generated_rro_product \
#    PixelTetheringOverlay2021 \
#    SettingsGoogle__auto_generated_rro_product \
#    SettingsProvider__auto_generated_rro_product \
#    SystemUIGXOverlay \
#    SystemUIGoogle__auto_generated_rro_product \
#    TeleService__auto_generated_rro_product \
#    Telecom__auto_generated_rro_product \
#    framework-res__auto_generated_rro_product \
    # NgaResources #############################
#    NgaResources \
    # PackageInstaller ########################
#    GooglePackageInstaller \
    # Phone
#    GoogleContacts \
#    GoogleContactsSyncAdapter \
#    GoogleDialer \
#    PrebuiltBugle \
    # Photo ####################################
#    GalleryGo \
#    MarkupGoogle \
    # Print ####################################
#    GooglePrintRecommendationService \
    # Security #################################
#    DevicePolicyPrebuilt \
    # Setup ####################################
#    GoogleOneTimeInitializer \
#    GoogleRestorePrebuilt \
#    PartnerSetupPrebuilt \
#    SetupWizardPrebuilt \
#    PixelSetupWizard \
    # Sound ####################################
#    SoundPickerPrebuilt \
    # Tags #####################################
#    TagGoogle \
    # Turbo ####################################
#    TurboPrebuilt \
#    TurboAdapter \
    # Voice ####################################
#    GoogleTTS \
#    talkback
#    RecorderPrebuilt \
    # Wellbeing ################################
#    WellbeingPrebuilt
LOCAL_OVERRIDES_PACKAGES := \
    CarrierMetrics \
    Chrome \
    Chrome-Stub \
    DiagnosticsToolPrebuilt \
    ConnMO \
    ConnMetrics \
    DCMO \
    DMService \
    DeskClock \
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
    AmbientSensePrebuilt \
    DevicePolicyPrebuilt \
    OBDM_Permissions \
    obdm_stub \
    PartnerSetupPrebuilt \
    Showcase \
    Drive \
    Ornament \
    Videos \
    Video \
    ScribePrebuilt \
    Velvet \
    Papers \
    GoogleTTS \
    AmbientStreaming \
    CarrierSetup \
    GoogleFeedback \
    PixelSetupWizard \
    QuickAccessWallet \
    BetterBugStub \
    GooglePrintRecommendationService \
    TagGoogle \
    PrintSpooler \
    Stk \
    BuiltInPrintservice \
    MicropaperPrebuilt \
    PrebuiltGoogleTelemetryTvp \
    EmergencyInfoGoogleNoUi \
    MaestroPrebuilt \
    OdadPrebuilt \
    SecurityHubPrebuilt \
    WellbeingPrebuilt \
    talkback \
    Snap \
    SafetyHubPrebuilt \
    GoogleTTS \
    LocationHistoryPrebuilt \
    MarkupGoogle \
    NgaResources \
    PrebuiltBugle \
    PrebuiltDeskClockGoogle \
    SoundAmplifierPrebuilt \
    WellbeingPrebuilt \
    Betterbug \
    AndroidPlatformServices \
    CarrierServices \
    ConfigUpdater \
    DeviceIntelligenceNetworkPrebuilt \
    DevicePersonalizationPrebuiltPixel2022 \
    EmergencyInfoGms \
    FamilyLinkParentalControls \
    GoogleExtShared \
    GoogleExtServices \
    GoogleFeedback \
    GoogleLocationHistory \
    GooglePrintRecommendationService \
    Messages \
    PersonalSafety \
    SpeechServicesByGoogle \
    SettingsIntelligenceGooglePrebuilt \
    SoundPickerPrebuilt \
    TagGoogle \
    Wellbeing 

LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
