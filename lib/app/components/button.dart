import 'package:flutter/material.dart';

import '../utils/color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 40,
  });
  final VoidCallback onPressed;
  final String text;
  final int height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: PRIMARY_COLOR,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: height / 2,
          ),
          textStyle: const TextStyle(fontSize: 16)),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
