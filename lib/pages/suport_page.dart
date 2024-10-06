import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
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
                'Suporte',
                style: TextStyle(
                  fontFamily: 'InriaSerif',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFFC99856),
                ),
              ),

              const SizedBox(height: 24),

              // DESCRIÇÃO
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Se você tiver alguma dúvida ou problema, entre em contato conosco através do e-mail ou telefone abaixo.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InriaSerif',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // E-MAIL
              const Text(
                'Email: suporte@exemplo.com',
                style: TextStyle(
                  fontFamily: 'InriaSerif',
                  fontSize: 16,
                  color: Color(0xFFC99856),
                ),
              ),

              const SizedBox(height: 12),

              // TELEFONE
              const Text(
                'Telefone: (00) 12345-6789',
                style: TextStyle(
                  fontFamily: 'InriaSerif',
                  fontSize: 16,
                  color: Color(0xFFC99856),
                ),
              ),

              const SizedBox(height: 24),

              // BOTÃO DE VOLTAR
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xC8000000),
                  minimumSize: const Size(318, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // Voltar à tela anterior
                },
                child: const Text(
                  'Voltar',
                  style: TextStyle(
                    fontFamily: 'InriaSerif',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFFC99856),
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
