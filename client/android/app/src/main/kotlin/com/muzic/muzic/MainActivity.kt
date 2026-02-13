package com.muzic.muzic

import android.content.ComponentName
import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.muzic.muzic/app_icon"

    // Map icon index to activity-alias name (matching your AndroidManifest.xml)
    private val iconAliases = mapOf(
        1 to "com.muzic.muzic.LauncherDefault",
        2 to "com.muzic.muzic.LauncherDiwali",
        3 to "com.muzic.muzic.LauncherHoli"
    )

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "changeAppIcon" -> {
                    val iconIndex = call.argument<Int>("iconIndex") ?: 1
                    val success = changeAppIcon(iconIndex)
                    result.success(success)
                }
                "getCurrentIcon" -> {
                    val currentIcon = getCurrentIcon()
                    result.success(currentIcon)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun changeAppIcon(iconIndex: Int): Boolean {
        if (iconIndex !in iconAliases.keys) return false

        val pm = packageManager

        // Enable only the selected alias, disable others
        iconAliases.forEach { (index, aliasName) ->
            val state = if (index == iconIndex) {
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED
            } else {
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED
            }

            pm.setComponentEnabledSetting(
                ComponentName(this, aliasName),
                state,
                PackageManager.DONT_KILL_APP
            )
        }

        return true
    }

    private fun getCurrentIcon(): Int {
        val pm = packageManager

        for ((index, aliasName) in iconAliases) {
            val state = pm.getComponentEnabledSetting(
                ComponentName(this, aliasName)
            )
            // Check if this alias is enabled or if it's the default (index 1) and in default state
            if (state == PackageManager.COMPONENT_ENABLED_STATE_ENABLED ||
                (state == PackageManager.COMPONENT_ENABLED_STATE_DEFAULT && index == 1)) {
                return index
            }
        }

        return 1 // Fallback to default
    }
}
