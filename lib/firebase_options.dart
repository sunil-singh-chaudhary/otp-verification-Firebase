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
    apiKey: 'AIzaSyAor_tMOEcCqQeXLtaI9AO48WXZdIkNz88',
    appId: '1:556873398636:web:702759dbda5a78baeb5b49',
    messagingSenderId: '556873398636',
    projectId: 'otptestingflutter',
    authDomain: 'otptestingflutter.firebaseapp.com',
    storageBucket: 'otptestingflutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAANTe-5tZPtVkFrHd-f1d5ruWpAKItdzk',
    appId: '1:556873398636:android:0f3ec7627bed567beb5b49',
    messagingSenderId: '556873398636',
    projectId: 'otptestingflutter',
    storageBucket: 'otptestingflutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1CqW-RA8DJ4Xx79IxfnuB5gsR75exwLk',
    appId: '1:556873398636:ios:72aa5ab250f549a3eb5b49',
    messagingSenderId: '556873398636',
    projectId: 'otptestingflutter',
    storageBucket: 'otptestingflutter.appspot.com',
    iosBundleId: 'com.example.blocTestFirebaseDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1CqW-RA8DJ4Xx79IxfnuB5gsR75exwLk',
    appId: '1:556873398636:ios:1d212902a4623de1eb5b49',
    messagingSenderId: '556873398636',
    projectId: 'otptestingflutter',
    storageBucket: 'otptestingflutter.appspot.com',
    iosBundleId: 'com.example.blocTestFirebaseDemo.RunnerTests',
  );
}