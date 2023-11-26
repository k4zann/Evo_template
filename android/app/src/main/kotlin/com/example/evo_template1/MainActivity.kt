package com.example.evo_template1

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("9d26b3f8-fd3d-4864-884c-f0ea88f3d6f8") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}
