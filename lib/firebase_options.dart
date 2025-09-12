import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAqA2odW9t_D9LpKH4daRmC1OG82ljHR3A',
    authDomain: 'threatlens-383bd.firebaseapp.com',
    projectId: 'threatlens-383bd',
    storageBucket: 'threatlens-383bd.appspot.com',
    messagingSenderId: '900963545905',
    appId: 'web-app-id',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqA2odW9t_D9LpKH4daRmC1OG82ljHR3A',
    projectId: 'threatlens-383bd',
    messagingSenderId: '900963545905',
    storageBucket: 'threatlens-383bd.appspot.com',
    appId: '1:900963545905:android:af74fa18cca589012b3610',
  );
}
