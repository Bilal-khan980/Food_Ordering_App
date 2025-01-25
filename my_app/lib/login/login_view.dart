import 'package:flutter/material.dart';
import 'package:my_app/common_widget/round_button.dart';
import 'package:my_app/common_widget/textfield.dart';
import 'package:my_app/login/signup_view.dart';
import 'package:my_app/on_boarding/onboarding.dart';
import '../common/colours.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                onPressed: () async {
                  try {
                    // Sign in the user
                    UserCredential userCredential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );

                    // Get the user's UID
                    final uid = userCredential.user?.uid;

                    if (uid == null) {
                      throw Exception("User ID is null");
                    }

                    // Check if the user exists in Firestore
                    DocumentSnapshot userDoc = await FirebaseFirestore.instance
                        .collection('users')
                        .doc(uid)
                        .get();

                    if (userDoc.exists) {
                      // User exists in the database, navigate to the new page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingScreens()),
                      );
                    } else {
                      // User does not exist in Firestore
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("User not found in the database")),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    // Handle Firebase Authentication errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(e.message ?? "Authentication error!")),
                    );
                  } catch (e) {
                    // Handle other errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${e.toString()}")),
                    );
                  }
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
