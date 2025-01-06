// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../common/colours.dart';

class Roundbutton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String bgCOlor;
  const Roundbutton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.bgCOlor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: bgCOlor == "p" ? Colourss.primaryColor : Colourss.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Colourss.primaryColor,
              width: 2.0,
            )),
        height: 56,
        alignment: Alignment.center,
        child: Text(text,
            style: TextStyle(
                color: bgCOlor == "p" ? Colourss.white : Colourss.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
