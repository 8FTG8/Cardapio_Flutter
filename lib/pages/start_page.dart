import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';
import 'package:app_flutter/widgets/elevated_button_1.dart';
import 'package:app_flutter/widgets/elevated_button_2.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override 
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              CustomElevatedButton1(
                labelText: 'Log In', 
                fontSize: 22, 
                minimumSize: Size(318, 54), 
                onPressed: () {Navigator.pushNamed(context, 'LoginPage');
                },
              ),

              //SIGN UP
              SizedBox(height: 18),
              CustomElevatedButton1(
                labelText: 'Sign Up',
                fontSize: 22, 
                minimumSize: Size(318, 54), 
                onPressed: () {Navigator.pushNamed(context, 'SignUpPage');
                },
              ),

              //DIVIDER
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
              CustomElevatedButton2(
                labelText: 'Continue with Google', 
                icon: 'assets/images/logo_google.png', 
                onPressed: () {},
              ),
              
              //PRIVACY TERM
              Spacer(),
              Text('By clicking continue, you agree to our',
                style: TextStyle(
                  fontSize: 14, 
                  color: Colors.grey
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Terms & Conditions',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFC99856),
                      decoration: TextDecoration.underline)),
                  Text(' and ',
                    style: TextStyle(
                      fontSize: 14, 
                      color: Colors.grey)),
                  Text('Privacy Policy',
                    style: TextStyle(
                      fontSize: 14,
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
