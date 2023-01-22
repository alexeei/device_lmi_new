/*
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.devicesettings.fch;

import android.os.Bundle;
import android.view.MenuItem;
import android.content.Context;
import android.content.SharedPreferences;
import android.provider.Settings;

import androidx.preference.Preference;
import androidx.preference.Preference.OnPreferenceChangeListener;
import androidx.preference.PreferenceFragment;
import androidx.preference.SwitchPreference;

import org.lineageos.devicesettings.R;
import org.lineageos.devicesettings.fch.FchUtils;
import org.lineageos.devicesettings.utils.FileUtils;

public class FchSettingsFragment extends PreferenceFragment implements
        OnPreferenceChangeListener {

    private static final String FCH_ENABLE_KEY = "fch_enable";
    public static final String SHAREDFCH = "SHAREDFCH";

    private SwitchPreference mFCHPreference;

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
      addPreferencesFromResource(R.xml.fch_settings);
        getActivity().getActionBar().setDisplayHomeAsUpEnabled(true);
        mFCHPreference = (SwitchPreference) findPreference(FCH_ENABLE_KEY);
        mFCHPreference.setEnabled(true);
        mFCHPreference.setOnPreferenceChangeListener(this);
        enableFCH(0);
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        if (FCH_ENABLE_KEY.equals(preference.getKey())) {
            enableFCH((Boolean) newValue ? 1 : 0);
        }
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            getActivity().onBackPressed();
            return true;
        }
        return false;
    }

    private void enableFCH(Integer enable) {
            FileUtils.writeLine(FchUtils.FCH_FILE, enable.toString());
            SharedPreferences preferences = getActivity().getSharedPreferences(SHAREDFCH,Context.MODE_PRIVATE);
            SharedPreferences.Editor editor = preferences.edit();
            editor.putInt(SHAREDFCH, enable);
            editor.commit();
    }
}
