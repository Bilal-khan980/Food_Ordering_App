import 'package:flutter/material.dart';
import 'package:my_app/common_widget/round_button.dart';
import 'package:my_app/common_widget/textfield.dart';
import 'package:my_app/login/login_view.dart';
import '../common/colours.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrmpasswordController = TextEditingController();
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
              child: Text('SIGN UP',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colourss.primarytext,
                  )),
            ),
            SizedBox(
              height: view.height * 0.02,
            ),
            Text('Add your details to sign up',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colourss.secondarytext,
                )),
            SizedBox(
              height: view.height * 0.02,
            ),
            CustomTextField(
              controller: nameController,
              hintText: 'Name',
              keyboardType: TextInputType.text,
            ),
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
              controller: mobilenumberController,
              hintText: 'Mobile Number',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: view.height * 0.02,
            ),
            CustomTextField(
              controller: addressController,
              hintText: 'Address',
              keyboardType: TextInputType.text,
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
            CustomTextField(
              controller: confrmpasswordController,
              hintText: 'Confirm Password',
              isPassword: true,
            ),
            SizedBox(
              height: view.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Roundbutton(
                text: "SIGN UP",
                bgCOlor: "p",
                onPressed: () async {
                  if (passwordController.text !=
                      confrmpasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Passwords do not match!")),
                    );
                    return;
                  }

                  try {
                    // Create User with Email and Password
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );

                    // Save additional user information in Firestore
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userCredential.user?.uid)
                        .set({
                      'name': nameController.text.trim(),
                      'email': emailController.text.trim(),
                      'mobile': mobilenumberController.text.trim(),
                      'address': addressController.text.trim(),
                      'uid': userCredential.user?.uid,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Sign up successful!")),
                    );

                    // Navigate to Login Screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.message ?? "Error occurred!")),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: view.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have an Account?",
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
                            builder: (context) => const LoginView()));
                  },
                  child: Text(
                    "Login",
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
