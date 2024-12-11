//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_flutter/widgets/gradient_background.dart';
import 'package:app_flutter/widgets/elevated_button_1.dart';
import 'package:app_flutter/widgets/text_field.dart';

// Lista global para armazenar usuários cadastrados
List<Map<String, String>> registeredUsers = [];

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controladores de texto para capturar dados de entrada
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Função para validar e cadastrar um novo usuário
  Future <void> registerUser() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Verificação se os campos estão preenchidos
    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showErrorMessage("Todos os campos são obrigatórios!");
      return;
    }

    // Verificação se o e-mail é válido
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      showErrorMessage("Por favor, insira um e-mail válido.");
      return;
    }

    // Verificação se as senhas coincidem
    if (password != confirmPassword) {
      showErrorMessage("As senhas não coincidem.");
      return;
    }

    // Verificação se a senha possui critérios básicos de segurança (mínimo 8 caracteres)
    if (password.length < 8) {
      showErrorMessage("A senha deve ter no mínimo 8 caracteres.");
      return;
    }

    // Criação de usuário no Firebase Authentication
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );


    // Armazenamento de informações adicionais no Firestore
    await _firestore.collection('usuarios').doc(userCredential.user!.uid).set({
      'name:': name,
      'email': email,
    });

    showSuccessMessage("Cadastro realizado com sucesso!");
    Navigator.pushNamed(context, 'StartPage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showErrorMessage("Este e-mail já está cadastrado. Por favor, fça o login");

      } else if (e.code == 'weak-password') {
        showErrorMessage("A senha é muito frac.");

      } else {
        showErrorMessage("Erro: ${e.message}");

      }
    } catch (e) {
      showErrorMessage("Ocorreu um erro inesperado. Por favor, tente novamente.");
    }
  }

  // Função para exibir mensagem de erro
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Função para exibir mensagem de sucesso
  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
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

                // TÍTULO SIGN UP
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xFFC99856),
                        ),
                        onPressed: () {Navigator.pushNamed(context, 'StartPage');
                        },
                      ),
                      const SizedBox(width: 18),
                      const Text('Sign Up',
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
                CustomTextField(controller: nameController, labelText: 'Nome', hintText: 'Informe seu nome', obscureText: false),

                const SizedBox(height: 18),
                CustomTextField(controller: emailController, labelText: 'Email', hintText: 'Informe seu email', obscureText: false),

                const SizedBox(height: 18),
                CustomTextField(controller: passwordController, labelText: 'Senha', hintText: 'Informe sua senha', obscureText: true),

                const SizedBox(height: 18),
                CustomTextField(controller: confirmPasswordController, labelText: 'Confirmação', hintText: 'Confirme sua senha', obscureText: true),

                // BOTÃO SIGN UP
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton1(labelText: 'Sign Up', onPressed: registerUser, minimumSize: Size(138, 48), fontSize: 18),
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