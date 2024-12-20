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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNEiGF5HRGWJWZUruDqypEAdDpBbnbzxY',
    appId: '1:739850477670:android:c24a7505b742c2e0da0da7',
    messagingSenderId: '739850477670',
    projectId: 'flow-a-chat-app',
    storageBucket: 'flow-a-chat-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqKIrvgdzlfp4Br-fzPSzdQ0_y_h0qVus',
    appId: '1:739850477670:ios:64d5721ddc8b12c7da0da7',
    messagingSenderId: '739850477670',
    projectId: 'flow-a-chat-app',
    storageBucket: 'flow-a-chat-app.firebasestorage.app',
    androidClientId: '739850477670-tu3e8l1609c8bd03bkeihs9i8670is53.apps.googleusercontent.com',
    iosClientId: '739850477670-h305lb05nnocacmu6cpcfqhl46j1n0h6.apps.googleusercontent.com',
    iosBundleId: 'com.example.flow',
  );

}