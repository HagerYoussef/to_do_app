// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCfvi4g3BQXdiAoOMqV5hx98XRGv3CMplE',
    appId: '1:925745543531:web:a5df89c1149a16e01f742e',
    messagingSenderId: '925745543531',
    projectId: 'to-do-application-1c8e6',
    authDomain: 'to-do-application-1c8e6.firebaseapp.com',
    storageBucket: 'to-do-application-1c8e6.appspot.com',
    measurementId: 'G-XBFSLR2T6W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkerddXLFbMuHXF3LEJxyAePxHiW0_Hto',
    appId: '1:925745543531:android:42d7057814ba7bff1f742e',
    messagingSenderId: '925745543531',
    projectId: 'to-do-application-1c8e6',
    storageBucket: 'to-do-application-1c8e6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJNJ7h2nbpd2lb1jUHlwYBWxQR1p3PO1o',
    appId: '1:925745543531:ios:0c238a74e5e7897e1f742e',
    messagingSenderId: '925745543531',
    projectId: 'to-do-application-1c8e6',
    storageBucket: 'to-do-application-1c8e6.appspot.com',
    iosBundleId: 'com.example.toDo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJNJ7h2nbpd2lb1jUHlwYBWxQR1p3PO1o',
    appId: '1:925745543531:ios:0c238a74e5e7897e1f742e',
    messagingSenderId: '925745543531',
    projectId: 'to-do-application-1c8e6',
    storageBucket: 'to-do-application-1c8e6.appspot.com',
    iosBundleId: 'com.example.toDo',
  );
}
