# biometricauth
changes done for biometric to work
1- go to android\app\src\main\AndroidManifest.xml and add these at the very top
```xml
        <manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.biometricauth">
    <!-- my addons-->
        <!-- 🔐 Add biometric and fingerprint permissions -->
    <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
    <uses-permission android:name="android.permission.USE_FINGERPRINT"/>

        <!-- Optional: Let Play Store know your app supports fingerprint -->
    <uses-feature
        android:name="android.hardware.fingerprint"
        android:required="false" />
    <!-- my addons end-->
```
2- go to android\app\src\main\kotlin\com\example\biometricauth\MainActivity.kt and change it to fragmented activity
```kotlin
    package com.example.biometricauth

    import io.flutter.embedding.android.FlutterFragmentActivity

    class MainActivity: FlutterFragmentActivity() {
    }
```
3. Go to `ios/Runner/Info.plist` and add this inside the `<dict>`:

```xml
<key>NSFaceIDUsageDescription</key>
<string>We use Face ID or Touch ID to secure your Safenest vault.</string>
```

4- in terminal , add dependency by running this command
    flutter pub add local_auth