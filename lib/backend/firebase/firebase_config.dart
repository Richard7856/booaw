import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCfHd0gx_bHW7rKjGjIhifG5SF4NmOVb8I",
            authDomain: "sientete-en-casa.firebaseapp.com",
            projectId: "sientete-en-casa",
            storageBucket: "sientete-en-casa.appspot.com",
            messagingSenderId: "218151181176",
            appId: "1:218151181176:web:982cabf95a66326aabc68d",
            measurementId: "G-MKK1T7DWK3"));
  } else {
    await Firebase.initializeApp();
  }
}
