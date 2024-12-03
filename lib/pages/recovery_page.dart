import 'package:app_flutter/widgets/elevated_button_1.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';
import 'package:app_flutter/widgets/text_field.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final TextEditingController emailController = TextEditingController();

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
              
              // RECUPERAR SENHA
              Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    // Title
                    SizedBox(height: 24),
                    Text('Recuperar Senha',
                      style: TextStyle(
                        fontFamily: 'InriaSerif',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFFC99856),
                      ),
                    ),
                    
                    // Email Input Field
                    SizedBox(height: 24),
                    CustomTextField(controller: emailController, labelText: 'Email', hintText: 'Informe seu e-mail', obscureText: false),

                    //Enviar Email
                    const SizedBox(height: 24),
                    CustomElevatedButton1(labelText: 'Enviar e-mail', onPressed: () {}, minimumSize: Size(318, 54), fontSize: 22),

                    //Voltar para Login
                    const SizedBox(height: 18),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'LoginPage');
                        },
                      child: Text('Voltar à página de login',
                        style: TextStyle(
                          fontFamily: 'InriaSerif',
                          fontSize: 18,
                          color: Color(0xFFC99856),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFC99856),
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