import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double _rating = 0; // Armazena a avaliação do usuário
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TÍTULO
              const Text(
                'Avaliação do Usuário',
                style: TextStyle(
                  fontFamily: 'InriaSerif',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFFC99856),
                ),
              ),
              const SizedBox(height: 24),

              // ESCOLHA A NOTA
              const Text(
                'Avalie nosso serviço:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating
                          ? Icons.star
                          : Icons.star_border,
                      color: const Color(0xFFC99856),
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1.0; // Define a nota escolhida
                      });
                    },
                  );
                }),
              ),
              
              const SizedBox(height: 24),

              // CAMPO DE FEEDBACK
              const Text(
                'Deixe seu feedback:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _feedbackController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Escreva seu feedback aqui...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFC99856)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFC99856)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 24),

              // BOTÃO ENVIAR
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xC8000000),
                  minimumSize: const Size(318, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Lógica para enviar avaliação e feedback
                  print('Avaliação: $_rating');
                  print('Feedback: ${_feedbackController.text}');
                },
                child: const Text(
                  'Enviar Avaliação',
                  style: TextStyle(
                    fontFamily: 'InriaSerif',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFFC99856),
                  ),
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
