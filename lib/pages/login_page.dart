//DESIGN: FINALIZADO 
//FUNCIONALIDADES: NÃO FINALIZADO

import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override 
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget customTextField(String labelText, String hintText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: Color(0x8FFFFFFF)),
            border: OutlineInputBorder(),
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFFFFFFFF)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFC99856),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFC99856)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 18,
          ),
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

              //TÍTULO LOGIN
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFFC99856),
                        ),
                        onPressed: () {Navigator.pushNamed(context, 'StartPage');},
                      ),
                      SizedBox(width: 18),
                      Text('Log In',
                        style: TextStyle(
                          fontFamily: 'InriaSerif',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFFC99856),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 24),
              customTextField('Email', 'Informe seu email', false),

              const SizedBox(height: 18),
              customTextField('Senha', 'Informe sua senha', true),

              //ESQUECEU A SENHA?
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'PasswordRecoveryPage');
                    },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Esqueceu a senha?',
                      style: TextStyle(
                        fontFamily: 'InriaSerif',
                        fontSize: 14,
                        color: Color(0xFFC99856),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFC99856),
                      ),
                    ),
                  ),
                ),
              ),

            //BUTTON LOGIN
              const SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.only(right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 42,
                      width: 138,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xC8000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'MenuPage');
                        },
                        child: Text('Log In',
                          style: TextStyle(
                            fontFamily: 'InriaSerif',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFFC99856),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}