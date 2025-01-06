import 'package:flutter/material.dart';
import 'package:my_app/common_widget/round_button.dart';
import 'package:my_app/login/login_view.dart';
import '../common/colours.dart';

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
          SizedBox(
            height: media.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Discover the best foods from over 1,000 restaurants and fast delivery to your \ndoorstep',
              style: TextStyle(
                  color: Colourss.secondarytext,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: media.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Roundbutton(
              text: "LOGIN",
              bgCOlor: "p",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
            ),
          ),
          SizedBox(
            height: media.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Roundbutton(
              text: "CREATE AN ACCOUNT",
              bgCOlor: "x",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
