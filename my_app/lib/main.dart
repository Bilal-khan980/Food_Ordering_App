import 'package:flutter/material.dart';
import 'package:my_app/login/signup_view.dart';
//import 'package:my_app/on_boarding/splashview.dart';
//import 'package:my_app/login/welcome_view.dart';

void main() {
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
      home: const SignUp(),
      //home: const WelcomeView(),
    );
  }
}
