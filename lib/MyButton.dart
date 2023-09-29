import 'package:flutter/material.dart';
import 'package:sdgp/constants.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  MyButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      child:
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child:
        Text(text,
          style: TextStyle(
            color: kTextColor,
            fontSize: 15.0,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),

          ),
          backgroundColor: kButtonColor.withOpacity(0.5)

      ),
      onPressed: onPressed,
    );
  }
}