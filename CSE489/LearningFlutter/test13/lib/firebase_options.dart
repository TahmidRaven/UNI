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
    apiKey: 'AIzaSyBv2fNnBa_FhLuAqwjMjWaECtU4PwK7woE',
    appId: '1:801450604084:web:a6bddfb328361e87017c61',
    messagingSenderId: '801450604084',
    projectId: 'test13-73bc4',
    authDomain: 'test13-73bc4.firebaseapp.com',
    storageBucket: 'test13-73bc4.appspot.com',
    measurementId: 'G-0BQD9865GF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVfKCVsHvHrw9PVgSGjH3aRHWo1Gou_uQ',
    appId: '1:801450604084:android:0c83bb1cba1e3a84017c61',
    messagingSenderId: '801450604084',
    projectId: 'test13-73bc4',
    storageBucket: 'test13-73bc4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlbz3xBJ_nMkZPvBAemBdatiyw1Omgb8w',
    appId: '1:801450604084:ios:ec30de7e90bd5774017c61',
    messagingSenderId: '801450604084',
    projectId: 'test13-73bc4',
    storageBucket: 'test13-73bc4.appspot.com',
    iosBundleId: 'com.example.test13',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlbz3xBJ_nMkZPvBAemBdatiyw1Omgb8w',
    appId: '1:801450604084:ios:ec30de7e90bd5774017c61',
    messagingSenderId: '801450604084',
    projectId: 'test13-73bc4',
    storageBucket: 'test13-73bc4.appspot.com',
    iosBundleId: 'com.example.test13',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBv2fNnBa_FhLuAqwjMjWaECtU4PwK7woE',
    appId: '1:801450604084:web:347abb2260a03aa5017c61',
    messagingSenderId: '801450604084',
    projectId: 'test13-73bc4',
    authDomain: 'test13-73bc4.firebaseapp.com',
    storageBucket: 'test13-73bc4.appspot.com',
    measurementId: 'G-6KTP4H2J9M',
  );
}
