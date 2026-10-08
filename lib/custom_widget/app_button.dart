import 'package:flutter/material.dart';

import 'apptext.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key, required this.onPressed, required this.text,
  });
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff064D82),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: AppText(
        text: text,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        colors: Colors.white,
      ),
    );
  }
}