import 'package:flutter/material.dart';
//import 'package:my_app/login/signup_view.dart';
import 'package:my_app/on_boarding/splashview.dart';
//import 'package:my_app/login/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const SignUp(),
      home: const SplashScreen(),
    );
  }
}
