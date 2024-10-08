// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCpMdPTX4zq4xj6AdIPyqucAeHYyOqhpEk',
    appId: '1:146316928683:web:e78d748d56562abeddf9ee',
    messagingSenderId: '146316928683',
    projectId: 'wechat-81716',
    authDomain: 'wechat-81716.firebaseapp.com',
    storageBucket: 'wechat-81716.appspot.com',
    measurementId: 'G-5T3SZKCKLP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDy71X0Z1ZsQvbF0bc2Vhg2tgrPE047ORU',
    appId: '1:146316928683:android:0eb9b544b8c52843ddf9ee',
    messagingSenderId: '146316928683',
    projectId: 'wechat-81716',
    storageBucket: 'wechat-81716.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAKT3-GrBXzfHulgFmOwMi3Sp5nqn-rus',
    appId: '1:146316928683:ios:9f58d8e1632c23b9ddf9ee',
    messagingSenderId: '146316928683',
    projectId: 'wechat-81716',
    storageBucket: 'wechat-81716.appspot.com',
    iosBundleId: 'com.example.chatApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAKT3-GrBXzfHulgFmOwMi3Sp5nqn-rus',
    appId: '1:146316928683:ios:9f58d8e1632c23b9ddf9ee',
    messagingSenderId: '146316928683',
    projectId: 'wechat-81716',
    storageBucket: 'wechat-81716.appspot.com',
    iosBundleId: 'com.example.chatApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCpMdPTX4zq4xj6AdIPyqucAeHYyOqhpEk',
    appId: '1:146316928683:web:5b0cca5ae68cea30ddf9ee',
    messagingSenderId: '146316928683',
    projectId: 'wechat-81716',
    authDomain: 'wechat-81716.firebaseapp.com',
    storageBucket: 'wechat-81716.appspot.com',
    measurementId: 'G-1W1WZXNNHR',
  );
}
