import 'package:flutter/material.dart';

// BOTÕES PRETOS
class CustomElevatedButton1 extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;
  final Size minimumSize; // 318, 54
  final double fontSize; // 22

  const CustomElevatedButton1 ({
    Key? key,
    required this.labelText,
    required this.onPressed,
    required this.minimumSize,
    required this.fontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xC8000000),
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        labelText,
        style: TextStyle(
          fontFamily: 'InriaSerif',
          fontWeight: FontWeight.bold,
          fontSize: fontSize, 
          color: Color(0xFFC99856),
        ),
      ),
    );
  }
}