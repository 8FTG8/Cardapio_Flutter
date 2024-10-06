import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override 
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', 
                width: screenWidth, 
                height: screenHeight * 0.4, 
                fit: BoxFit.cover,
              ),

              SizedBox(height: 24)
            ],
          ),
        ),
      ),
    );
  }
}