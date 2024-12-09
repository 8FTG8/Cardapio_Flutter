import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';
import 'package:app_flutter/widgets/text_field.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  void loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showErrorMessage("Por favor, preencha todos os campos.");
      return;
    }
    
    if (!emailRegex.hasMatch(email)) {
      showErrorMessage("Por favor, insira um e-mail válido.");
      return;
    }
    
    // Se todos os requisitos forem atendidos, login bem-sucedido
    Navigator.pushNamed(context, 'MenuPage');

    // Tenta autenticacar com Firebase
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Se a autenticação for bem-sucedida
      if (userCredential.user != null) {
        Navigator.pushNamed(context, 'MenuPage');
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showErrorMessage("Nenhum usuário encontrado para esse e-mail.");
      } else if (e.code == 'wrong-password') {
        showErrorMessage("Senha incorreta.");
      }
    }
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png',
                  width: screenWidth,
                  height: screenHeight * 0.4,
                  fit: BoxFit.cover,
                ),

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
                        onPressed: () {
                          Navigator.pushNamed(context, 'StartPage');
                        },
                      ),

                      const SizedBox(width: 18),
                      const Text('Log In',
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
                CustomTextField(
                  controller: emailController, 
                  labelText: 'Email', 
                  hintText: 'Informe seu email', 
                  obscureText: false,
                ),

                const SizedBox(height: 18),
                CustomTextField(
                  controller: passwordController, 
                  labelText: 'Senha', 
                  hintText: 'Informe sua senha', 
                  obscureText: true,
                ),

                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'PasswordRecoveryPage');
                    },
                    child: const Align(
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

                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 42,
                        width: 138,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xC8000000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: loginUser,
                          child: const Text('Log In',
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
