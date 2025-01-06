import 'package:flutter/material.dart';
import '../common/colours.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text, // Default to regular text input
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType; // Added to handle different input types

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colourss.textfield,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword, // Hide text for password
        cursorColor: Colourss.primaryColor,
        keyboardType: keyboardType, // Set the keyboard type
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colourss.placeholder,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}
