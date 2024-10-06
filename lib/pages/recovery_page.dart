import 'package:flutter/material.dart';

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

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color(0xFF478197),
              Color(0xFF1C343D),
              Color(0xFF172A31),
            ],
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LOGO
              Image.asset(
                'assets/images/logo.png',
                width: screenWidth * 0.8,
                height: screenHeight * 0.3,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 24),

              // TÍTULO
              const Text(
                'Recuperar Senha',
                style: TextStyle(
                  fontFamily: 'InriaSerif',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFFC99856),
                ),
              ),

              const SizedBox(height: 24),

              // CAMPO DE E-MAIL
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: const OutlineInputBorder(),
                    hintText: 'Informe seu e-mail',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFC99856)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFC99856)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 24),

              // BOTÃO DE RECUPERAÇÃO
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xC8000000),
                  minimumSize: const Size(318, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Lógica para enviar email de recuperação
                },
                child: const Text(
                  'Enviar Email de Recuperação',
                  style: TextStyle(
                    fontFamily: 'InriaSerif',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFFC99856),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // LINK VOLTAR PARA LOGIN
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'LoginPage');
                },
                child: const Text(
                  'Voltar para Login',
                  style: TextStyle(
                    fontFamily: 'InriaSerif',
                    fontSize: 16,
                    color: Color(0xFFC99856),
                    decoration: TextDecoration.underline,
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
