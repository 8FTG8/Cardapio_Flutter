import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';
//import 'package:get_it/get_it.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double _rating = 0; // Armazena a avaliação do usuário
  final TextEditingController _feedbackController = TextEditingController();

  Widget customButton(String text, VoidCallback onPressed) {
    return  SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
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
            fontSize: 18,
            color: Color(0xFFC99856),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //Alinhamento vertical
            crossAxisAlignment: CrossAxisAlignment.center, //Alinhamento horizontal
            children: [

              //AVALIE NOSSO SERVIÇO
              const SizedBox(height: 30),
              const Text('Avalie nosso serviço!',
                style: TextStyle(
                  fontFamily: 'InriaSerif',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFFC99856),
                ),
              ),

              //ESTRELAS DE AVALIAÇÃO
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating
                          ? Icons.star
                          : Icons.star_border,
                      color: const Color(0xFFC99856)),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1.0; // Define a nota escolhida
                      });
                    },
                  );
                }),
              ),
              
              //DEIXE SEU FEEDBACK
              const SizedBox(height: 18),
              const Text('Deixe seu feedback:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),

              //CAMPO DE ESCREVER O FEEDBACK
              const SizedBox(height: 12),
              TextField(
                  controller: _feedbackController,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Escreva seu feedback aqui...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFC99856),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFC99856)),
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),

              //BOTÃO ENVIAR AVALIAÇÃO
              const SizedBox(height: 24),
              customButton('Enviar Avaliação', () {
                print('Avaliação: $_rating');
                print('Feedback: ${_feedbackController.text}');
              }),

              // BOTÃO DE VOLTAR
              const SizedBox(height: 18),
              customButton('Voltar', () {
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}