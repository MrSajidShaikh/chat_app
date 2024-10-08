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
    apiKey: 'AIzaSyBuEsmayJQzmDBt2asl1eJqqBVWhJONlBI',
    appId: '1:724816501621:web:5299094fcac9c04b35913c',
    messagingSenderId: '724816501621',
    projectId: 'chat-app-75f9d',
    authDomain: 'chat-app-75f9d.firebaseapp.com',
    storageBucket: 'chat-app-75f9d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCq0qUeDdPHB2k2fjgquWGdPVBsxGx-e8c',
    appId: '1:724816501621:android:300cb0113f806d0335913c',
    messagingSenderId: '724816501621',
    projectId: 'chat-app-75f9d',
    storageBucket: 'chat-app-75f9d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpatG8bHiAq9omQjXF9OgmEzytqsUYd0Q',
    appId: '1:724816501621:ios:222f9eb244c5738d35913c',
    messagingSenderId: '724816501621',
    projectId: 'chat-app-75f9d',
    storageBucket: 'chat-app-75f9d.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpatG8bHiAq9omQjXF9OgmEzytqsUYd0Q',
    appId: '1:724816501621:ios:222f9eb244c5738d35913c',
    messagingSenderId: '724816501621',
    projectId: 'chat-app-75f9d',
    storageBucket: 'chat-app-75f9d.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBuEsmayJQzmDBt2asl1eJqqBVWhJONlBI',
    appId: '1:724816501621:web:3b5698fa737779fb35913c',
    messagingSenderId: '724816501621',
    projectId: 'chat-app-75f9d',
    authDomain: 'chat-app-75f9d.firebaseapp.com',
    storageBucket: 'chat-app-75f9d.appspot.com',
  );
}
