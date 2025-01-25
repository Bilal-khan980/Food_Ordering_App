import 'package:flutter/material.dart';
import 'package:my_app/login/welcome_view.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('Hello, World!'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeView()));
              },
              child: Text('Go Back'))
        ],
      ),
    );
  }
}
