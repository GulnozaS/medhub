import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDVtXIoQk8KpYJtmHlRso61lYU7MhyQwZk",
            authDomain: "medhub-664cb.firebaseapp.com",
            projectId: "medhub-664cb",
            storageBucket: "medhub-664cb.appspot.com",
            messagingSenderId: "654248853254",
            appId: "1:654248853254:web:90139c8207c5da9735e887"));
  } else {
    await Firebase.initializeApp();
  }
}
