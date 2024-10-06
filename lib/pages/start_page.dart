//CRIAR UMA SAFE AREA
import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';
//import 'package:get_it/get_it.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override 
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Widget customButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xC8000000),
        minimumSize: Size(318, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'InriaSerif',
          fontWeight: FontWeight.bold,
          fontSize: 22, 
          color: Color(0xFFC99856),
        ),
      ),
    );
  }
  
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

              //TÍTULO
              SizedBox(height: 24),
              Text('O Luxo da Culinária',
                style: TextStyle(
                  fontFamily: 'InstrumentSerif',             
                  fontSize: 42,
                  color: Color(0xFFC99856),
                ),
              ),

              //LOGIN
              SizedBox(height: 24),
              customButton('Log In', () {}),

              //SIGNUP
              SizedBox(height: 18),
              customButton('Sign Up', () {}),

              //SEPARATOR
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 84,
                    child: Divider(color: Colors.white, thickness: 0.7),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('or',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  SizedBox(
                    width: 84,
                    child: Divider(color: Colors.white, thickness: 0.7),
                  ),
                ],
              ),

              //CONTINUE WITH GOOGLE
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo_google.png', width: 29),
                        SizedBox(width: 10),
                        Text('Continue with Google',
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
              ),
              
              //PRIVACY TERM
              Spacer(),
              Text('By clicking continue, you agree to our',
                style: TextStyle(
                  fontSize: 12, 
                  color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Terms & Conditions',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFC99856),
                      decoration: TextDecoration.underline)),
                  Text(' and ',
                    style: TextStyle(
                      fontSize: 12, 
                      color: Colors.grey)),
                  Text('Privacy Policy',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFC99856),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}