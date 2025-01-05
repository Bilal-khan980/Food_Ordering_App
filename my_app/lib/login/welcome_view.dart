import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Background shape
              Image.asset(
                'assets/images/Organetopshape.png',
                width: media.width,
                height: media.height * 0.6,
                fit: BoxFit.cover,
              ),
              // Positioned logo
              Positioned(
                top: media.height * 0.3, // Adjust the value to move it downward
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/Logo.png',
                    height: media.height * 0.4,
                    width: media.width * 0.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
