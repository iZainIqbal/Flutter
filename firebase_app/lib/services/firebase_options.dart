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
    apiKey: 'AIzaSyAOVBpAW09IqtdydR_U0-aUQoG-hVYp8kg',
    appId: '1:496469931956:web:0f84a8e2ed8ef75816e4e1',
    messagingSenderId: '496469931956',
    projectId: 'configfirebase-51b63',
    authDomain: 'configfirebase-51b63.firebaseapp.com',
    storageBucket: 'configfirebase-51b63.appspot.com',
    measurementId: 'G-TFEBGX3XRZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNnj9qAPCnzMf1raitdgoqAcXIolbgZIs',
    appId: '1:496469931956:android:b53777410606cdf616e4e1',
    messagingSenderId: '496469931956',
    projectId: 'configfirebase-51b63',
    storageBucket: 'configfirebase-51b63.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDltb_E63yMkt6clifyIkJVq-KhC0Oyc_g',
    appId: '1:496469931956:ios:68f116f942f68d2d16e4e1',
    messagingSenderId: '496469931956',
    projectId: 'configfirebase-51b63',
    storageBucket: 'configfirebase-51b63.appspot.com',
    iosBundleId: 'com.example.firebaseApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDltb_E63yMkt6clifyIkJVq-KhC0Oyc_g',
    appId: '1:496469931956:ios:fce0c79a3eae0d4016e4e1',
    messagingSenderId: '496469931956',
    projectId: 'configfirebase-51b63',
    storageBucket: 'configfirebase-51b63.appspot.com',
    iosBundleId: 'com.example.firebaseApp.RunnerTests',
  );
}
