import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';
//import 'package:get_it/get_it.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
    Widget customButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xC8000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(text,
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

              //RECUPERAR SENHA
              Padding(padding: EdgeInsets.symmetric(horizontal: 24.0),
              SizedBox(height: 24),
                child: Text('Recuperar Senha',
                  style: TextStyle(
                    fontFamily: 'InriaSerif',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFFC99856),
                  ),
                ),

                //EMAIL
                 SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0x8FFFFFFF)),
                      border: const OutlineInputBorder(),
                      hintText: 'Informe seu e-mail',
                      hintStyle: const TextStyle(color: Colors.white),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC99856))),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFC99856)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                
                //ENVIAR EMAIL
                const SizedBox(height: 24),
                customButton('Enviar email', () {}),

                //VOLTAR PARA LOGIN
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: () {Navigator.pushNamed(context, 'LoginPage');},
                  child: Text('Voltar para login',
                    style: TextStyle(
                      fontFamily: 'InriaSerif',
                      fontSize: 18,
                      color: Color(0xFFC99856),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFC99856),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
