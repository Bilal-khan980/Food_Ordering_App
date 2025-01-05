import 'package:flutter/material.dart';
import 'package:my_app/login/welcome_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    gotowelcomepage();
  }

  void gotowelcomepage() async {
    await Future.delayed(Duration(seconds: 5)); // Waits for 1 second
    welcome();
  }

  void welcome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WelcomeView()));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/Backgroundicons.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/images/Logo.png",
            width: media.width * 0.7,
            height: media.width * 0.7,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
