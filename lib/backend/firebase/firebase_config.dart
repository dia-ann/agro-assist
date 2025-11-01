import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD7g9oA7vzqQ_NyVEQt7o3fc3HPxgv-FCE",
            authDomain: "agroassist-da03e.firebaseapp.com",
            projectId: "agroassist-da03e",
            storageBucket: "agroassist-da03e.firebasestorage.app",
            messagingSenderId: "487361656019",
            appId: "1:487361656019:web:6cddc3de5532af61ec1026",
            measurementId: "G-HK8MN57JKZ"));
  } else {
    await Firebase.initializeApp();
  }
}
