import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

/// Configuração do Firebase do projeto `provafacil-906f0`, app Android `com.provafacil`.
///
/// Os valores são os de `android/app/google-services.json`, o mesmo arquivo do app Kotlin. Para
/// gerar de novo: `flutterfire configure --project=provafacil-906f0 --platforms=android`.
abstract final class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      throw UnsupportedError('O ProvaFacil só tem o Firebase configurado para Android.');
    }
    return android;
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPCHRhIUrHavTwNiIgdk8Io6cyPTpDiv4',
    appId: '1:875620379041:android:131c4ed8424361e44743e0',
    messagingSenderId: '875620379041',
    projectId: 'provafacil-906f0',
    storageBucket: 'provafacil-906f0.firebasestorage.app',
  );
}
