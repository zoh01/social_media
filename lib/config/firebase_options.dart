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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCleBpGhI1QfOPTDbs6mvWYVOrUfMdpRpg',
    appId: '1:308730482603:web:9f11c5538afee5da5f4cee',
    messagingSenderId: '308730482603',
    projectId: 'socialapp-f861b',
    authDomain: 'socialapp-f861b.firebaseapp.com',
    storageBucket: 'socialapp-f861b.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAC6wKpuO5XOoWcZGIorq5V4bDBGvE1ljY',
    appId: '1:308730482603:android:59dac7b25811e9555f4cee',
    messagingSenderId: '308730482603',
    projectId: 'socialapp-f861b',
    storageBucket: 'socialapp-f861b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBh2UZrD1_brPMYdyEzGqo4UCmzwPYyY8M',
    appId: '1:308730482603:ios:89f44f3498a361455f4cee',
    messagingSenderId: '308730482603',
    projectId: 'socialapp-f861b',
    storageBucket: 'socialapp-f861b.firebasestorage.app',
    iosBundleId: 'com.example.musicApp',
  );

}