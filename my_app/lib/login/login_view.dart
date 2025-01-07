import 'package:flutter/material.dart';
import 'package:my_app/common_widget/round_button.dart';
import 'package:my_app/common_widget/textfield.dart';
import 'package:my_app/login/signup_view.dart';
import '../common/colours.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var view = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: view.height * 0.1,
            ),
            Center(
              child: Text('LOGIN',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colourss.primarytext,
                  )),
            ),
            SizedBox(
              height: view.height * 0.02,
            ),
            Text('Add your details to login',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colourss.secondarytext,
                )),
            SizedBox(
              height: view.height * 0.02,
            ),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: view.height * 0.02,
            ),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              isPassword: true,
            ),
            SizedBox(
              height: view.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Roundbutton(
                text: "LOGIN",
                bgCOlor: "p",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));
                },
              ),
            ),
            SizedBox(
              height: view.height * 0.02,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Your Password?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colourss.secondarytext,
                ),
              ),
            ),
            SizedBox(
              height: view.height * 0.04,
            ),
            Text(
              'Or Login with',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colourss.secondarytext,
              ),
            ),
            SizedBox(
              height: view.height * 0.02,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff367FC0),
                  borderRadius: BorderRadius.circular(28),
                ),
                height: 56,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/facebook_icon.png',
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Login With Facebook',
                        style: TextStyle(
                            color: Colourss.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: view.height * 0.02,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffDD4B39),
                  borderRadius: BorderRadius.circular(28),
                ),
                height: 56,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google_icon.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Login With Google',
                        style: TextStyle(
                            color: Colourss.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: view.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colourss.secondarytext,
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colourss.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
