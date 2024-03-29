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
    apiKey: 'AIzaSyCV7C7sCboDTaydWMQuC_JcG0WJX5iIf3Y',
    appId: '1:1047250837254:web:e72b947a6b2e02cbea0887',
    messagingSenderId: '1047250837254',
    projectId: 'machines-talk',
    authDomain: 'machines-talk.firebaseapp.com',
    storageBucket: 'machines-talk.appspot.com',
    measurementId: 'G-4VT7CXES4E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjc4YDZSAIh6xhVVxkRNgLV-XdFlXdwxI',
    appId: '1:1047250837254:android:5f92f7d052ba834cea0887',
    messagingSenderId: '1047250837254',
    projectId: 'machines-talk',
    storageBucket: 'machines-talk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDP87GMaXzdelUV-JJYnAap5uXWxId5zgo',
    appId: '1:1047250837254:ios:1e0692a0e244dafaea0887',
    messagingSenderId: '1047250837254',
    projectId: 'machines-talk',
    storageBucket: 'machines-talk.appspot.com',
    iosBundleId: 'com.example.machinesTalkInit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDP87GMaXzdelUV-JJYnAap5uXWxId5zgo',
    appId: '1:1047250837254:ios:10f79828e5015300ea0887',
    messagingSenderId: '1047250837254',
    projectId: 'machines-talk',
    storageBucket: 'machines-talk.appspot.com',
    iosBundleId: 'com.example.machinesTalkInit.RunnerTests',
  );
}
