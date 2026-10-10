# CSSP Junior Portal: Firebase + Flutter

## A. Firebase (web) - 10 minutes
1. console.firebase.google.com > create project. Build > Authentication > enable **Email/Password**. Build > Firestore > create database.
2. Project settings > Your apps > Web (</>) > copy the config into `public/firebase-config.js`.
3. `npm i -g firebase-tools && firebase login && firebase init` (choose Hosting + Firestore, keep existing files) then `firebase deploy`.
4. Open your `https://<project>.web.app` link. Camera + mic now work for every student (https + Permissions-Policy header in firebase.json).
First login: a junior's first PIN becomes their password. Data syncs to Firestore `users/<rollno>` and follows them to any device.

## B. Flutter (Android / iOS) - same portal inside the app
1. `flutter create cssp_junior`, then copy `flutter_app/pubspec.yaml` and `flutter_app/lib/main.dart` over the new project. Put your Hosting URL in `kPortalUrl` (keep `?app=1`).
2. Android: in `android/app/src/main/AndroidManifest.xml` add inside `<manifest>`:
   `<uses-permission android:name="android.permission.INTERNET"/>`
   `<uses-permission android:name="android.permission.CAMERA"/>`
   `<uses-permission android:name="android.permission.RECORD_AUDIO"/>`
   `<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>`
   and set `minSdkVersion 21` in `android/app/build.gradle`.
3. iOS: in `ios/Runner/Info.plist` add `NSCameraUsageDescription` and `NSMicrophoneUsageDescription` with a short reason text.
4. `flutter pub get && flutter run`.

## Public-repository data note
The included roster entries use synthetic demo names and IDs. Keep real student personal information out of public repositories. Firebase web configuration is intentionally blank until configured for your own project.
