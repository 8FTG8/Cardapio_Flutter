//DESIGN: FINALIZADO
//FUNCIONALIDADES: NÃO FINALIZADO

import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png',
                  width: screenWidth,
                  height: screenHeight * 0.4,
                  fit: BoxFit.cover,
                ),

                //TÍTULO SIGN UP
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
                      Text('Sign Up',
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
                customTextField('Nome', 'Informe seu nome', false),

                const SizedBox(height: 18),
                customTextField('Email', 'Informe seu email', false),

                const SizedBox(height: 18),
                customTextField('Senha', 'Informe sua senha', true),

                const SizedBox(height: 18),
                customTextField('Confirmação', 'Confirme sua senha', true),

                //BUTTON SIGN UP
                const SizedBox(height: 24),
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
                          onPressed: () {Navigator.pushNamed(context, 'StartPage');},
                          child: Text('Sign Up',
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
      ),
    );
  }
}
