import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secret_diary/screens/auth.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:secret_diary/screens/on-boarding.dart';
import 'package:secret_diary/widgets/nav_bar.dart';

import 'package:secret_diary/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDUyd6BtKepckhn57omnBSWRGxrD4YiNs4",
        authDomain: "secret-diary-70001.firebaseapp.com",
        projectId: "secret-diary-70001",
        storageBucket: "secret-diary-70001.appspot.com",
        appId: "1:1011920507193:android:1007ac88f02271103dd8e8",
        messagingSenderId: "1011920507193",
        measurementId: "// measurementId"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 56, 226, 9)),
        primaryColor: Colors.lightGreen,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }

          if (snapshot.hasData) {
            return const NavBarScreen();
          }
          return const OnBoardingScreen();
        }),
      ),
    );
  }
}
