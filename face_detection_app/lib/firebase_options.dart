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
    apiKey: 'AIzaSyAMPpZE9Mq-wfg--Fw3pElNNfqvKAS2fU4',
    appId: '1:602051638706:web:8b1e458a320e573be260ab',
    messagingSenderId: '602051638706',
    projectId: 'facedetectionml-a4cdd',
    authDomain: 'facedetectionml-a4cdd.firebaseapp.com',
    storageBucket: 'facedetectionml-a4cdd.appspot.com',
    measurementId: 'G-Q5428V1T3J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDY9ST1rutjzwYS62I27piQ4bwor30vXQI',
    appId: '1:602051638706:android:1895528ad9a071d1e260ab',
    messagingSenderId: '602051638706',
    projectId: 'facedetectionml-a4cdd',
    storageBucket: 'facedetectionml-a4cdd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPXByoXcBXhofJB7tr_gOaPBoG-pKIY6M',
    appId: '1:602051638706:ios:1f051dd75951a48ae260ab',
    messagingSenderId: '602051638706',
    projectId: 'facedetectionml-a4cdd',
    storageBucket: 'facedetectionml-a4cdd.appspot.com',
    iosBundleId: 'com.example.faceDetectionApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPXByoXcBXhofJB7tr_gOaPBoG-pKIY6M',
    appId: '1:602051638706:ios:cfe5c19248ed4a9ee260ab',
    messagingSenderId: '602051638706',
    projectId: 'facedetectionml-a4cdd',
    storageBucket: 'facedetectionml-a4cdd.appspot.com',
    iosBundleId: 'com.example.faceDetectionApp.RunnerTests',
  );
}
