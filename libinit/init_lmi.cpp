/*
   Copyright (c) 2015, The Linux Foundation. All rights reserved.
   Copyright (C) 2016 The CyanogenMod Project.
   Copyright (C) 2019-2020 The LineageOS Project.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <cstdlib>
#include <fstream>
#include <unistd.h>
#include <vector>

#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <sys/sysinfo.h>

#include "property_service.h"
#include "vendor_init.h"

#include <fs_mgr_dm_linear.h>

#define GB(b) (b * 1024ull * 1024 * 1024)

using android::base::GetProperty;

void property_override(char const prop[], char const value[], bool add = true) {
    prop_info *pi;

    pi = (prop_info *)__system_property_find(prop);
    if (pi) {
        __system_property_update(pi, value, strlen(value));
    } else if (add) {
        __system_property_add(prop, strlen(prop), value, strlen(value));
    }
}

void full_property_override(const std::string &prop, const char value[], const bool product) {
    const int prop_count = 8;
    const std::vector<std::string> prop_types
        {"", "bootimage.", "odm.", "product.", "system.", "system_ext.", "vendor.", "vendor_dlkm.", "odm_dlkm."};

    for (int i = 0; i < prop_count; i++) {
        std::string prop_name = (product ? "ro.product." : "ro.") + prop_types[i] + prop;
        property_override(prop_name.c_str(), value);
    }
}

static const char *device_prop_key[] =
        { "brand", "device", "model", "cert", "name",
          "marketname", "manufacturer", "mod_device", nullptr };

static const char *device_prop_val[] =
        { "Redmi", "lmi", "POCO F2 Pro", "POCO F2 Pro", "lmi",
          "POCO F2 Pro", "Xiaomi", "lmi", nullptr };

/* From Magisk@native/jni/magiskhide/hide_utils.c */
static const char *cts_prop_key[] =
        { "ro.boot.vbmeta.device_state", "ro.boot.verifiedbootstate", "ro.boot.flash.locked",
          "ro.boot.veritymode", "ro.boot.warranty_bit", "ro.warranty_bit",
          "ro.debuggable", "ro.secure", "ro.build.type", "ro.build.tags",
          "ro.oem_unlock_supported",
          "ro.vendor.boot.warranty_bit", "ro.vendor.warranty_bit",
          "vendor.boot.vbmeta.device_state", nullptr };

static const char *cts_prop_val[] =
        { "locked", "green", "1",
          "enforcing", "0", "0",
          "0", "1", "user", "release-keys",
          "0",
          "0", "0",
          "locked", nullptr };

static const char *cts_late_prop_key[] =
        { "vendor.boot.verifiedbootstate", nullptr };

static const char *cts_late_prop_val[] =
        { "green", nullptr };

static const char *build_keys_props[] =
{
    "ro.build.tags",
    "ro.odm.build.tags",
    "ro.product.build.tags",
    "ro.system.build.tags",
    "ro.system_ext.build.tags",
    "ro.vendor.build.tags",
    nullptr
};

static void workaround_cts_properties() {
	// Hide all sensitive props
	for (int i = 0; cts_prop_key[i]; ++i) {
		property_override(cts_prop_key[i], cts_prop_val[i]);
	}
	for (int i = 0; cts_late_prop_key[i]; ++i) {
		property_override(cts_late_prop_key[i], cts_late_prop_val[i]);
	}
}

void vendor_load_properties() {
    const char *fingerprint = "Redmi/lmi/lmi:12/RKQ1.211001.001/V13.0.3.0.SJKMIXM:user/release-keys";
    const char *description = "Redmi/lmi/lmi:12/RKQ1.211001.001/V13.0.3.0.SJKMIXM:user/release-keys";

    full_property_override("build.fingerprint", fingerprint, false);
    full_property_override("build.description", description, false);

	for (int i = 0; device_prop_key[i]; ++i) {
        full_property_override(device_prop_key[i], device_prop_val[i], false);
        full_property_override(device_prop_key[i], device_prop_val[i], true);
	}
    full_property_override("build.product", "lmi", false);

    // Set hardware revision
    property_override("ro.boot.hardware.revision", GetProperty("ro.boot.hwversion", "").c_str());
    
    // Set product name to show when connect through usb
    property_override("vendor.usb.product_string", GetProperty("ro.product.marketname", "").c_str());

    /* Workaround CTS */
    workaround_cts_properties();

    /* Spoof Build keys */
	for (int i = 0; build_keys_props[i]; ++i) {
		property_override(build_keys_props[i], "release-keys");
	}

    // Enable UI blur
    property_override("ro.surface_flinger.supports_background_blur", "1");
    property_override("ro.sf.blurs_are_expensive", "1");

    // Set dalvik heap configuration
    std::string heapstartsize, heapgrowthlimit, heapsize, heapminfree,
			heapmaxfree, heaptargetutilization;

    struct sysinfo sys;
    sysinfo(&sys);
    if (sys.totalram > GB(7)) {
    // from - phone-xhdpi-8192-dalvik-heap.mk
        heapstartsize = "24m";
        heapgrowthlimit = "256m";
        heapsize = "512m";
        heaptargetutilization = "0.46";
        heapminfree = "8m";
        heapmaxfree = "48m";
    } else if (sys.totalram > GB(5)) {
        // from - phone-xhdpi-6144-dalvik-heap.mk
        heapstartsize = "16m";
        heapgrowthlimit = "256m";
        heapsize = "512m";
        heaptargetutilization = "0.5";
        heapminfree = "8m";
        heapmaxfree = "32m";
    } else if (sys.totalram > GB(3)) {
        // from - phone-xhdpi-4096-dalvik-heap.mk
        heapstartsize = "8m";
        heapgrowthlimit = "192m";
        heapsize = "512m";
        heaptargetutilization = "0.6";
        heapminfree = "8m";
        heapmaxfree = "16m";
    } else {
        // from - phone-xhdpi-2048-dalvik-heap.mk
        heapstartsize = "8m";
        heapgrowthlimit = "192m";
        heapsize = "512m";
        heaptargetutilization = "0.75";
        heapminfree = "512k";
        heapmaxfree = "8m";
    }

    property_override("dalvik.vm.heapstartsize", heapstartsize.c_str());
    property_override("dalvik.vm.heapgrowthlimit", heapgrowthlimit.c_str());
    property_override("dalvik.vm.heapsize", heapsize.c_str());
    property_override("dalvik.vm.heaptargetutilization", heaptargetutilization.c_str());
    property_override("dalvik.vm.heapminfree", heapminfree.c_str());
    property_override("dalvik.vm.heapmaxfree", heapmaxfree.c_str());

#ifdef __ANDROID_RECOVERY__
    std::string buildtype = GetProperty("ro.build.type", "userdebug");
    if (buildtype != "user") {
        property_override("ro.debuggable", "1");
        property_override("ro.adb.secure.recovery", "0");
    }

    android::fs_mgr::CreateLogicalPartitions("/dev/block/by-name/super");
#endif
}
