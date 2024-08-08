
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return FirebaseOptions(
      apiKey: 'AIzaSyDj_JBob03oZR87rYVY3fQD05G11OeAVYE',
      appId: '1:765090739400:android:45f348dc78abc12d6961fd',
      messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
      projectId: 'mansoura-b2c73',
      authDomain: 'YOUR_AUTH_DOMAIN',
      databaseURL: 'YOUR_DATABASE_URL',
      storageBucket: 'YOUR_STORAGE_BUCKET',
      measurementId: 'YOUR_MEASUREMENT_ID',
    );
  }
}