import 'package:flutter/material.dart';

// BOTÃO DO GOOGLE
class CustomElevatedButton2 extends StatelessWidget {
  final String labelText;
  final String icon;
  final VoidCallback onPressed;

  const CustomElevatedButton2 ({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: SizedBox(
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, width: 29),
              SizedBox(width: 10),
              Text(
                labelText,
                style: TextStyle(
                  fontFamily: 'InriaSerif',
                  fontWeight: FontWeight.bold,
                  fontSize: 18, 
                  color: Color(0xFF1B313A)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}