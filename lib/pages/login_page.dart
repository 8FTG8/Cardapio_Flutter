import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';
import 'package:app_flutter/main.dart'; // Para acessar a lista global registeredUsers

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores de texto para capturar dados de entrada
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Expressão regular para validar formato de e-mail
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Função para verificar login
  void loginUser() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Verificação se os campos estão preenchidos e se o e-mail é válido
    if (email.isEmpty || password.isEmpty) {
      showErrorMessage("Por favor, preencha todos os campos.");
      return;
    }
    
    if (!emailRegex.hasMatch(email)) {
      showErrorMessage("Por favor, insira um e-mail válido.");
      return;
    }

    // Verificação se o usuário está cadastrado
    bool userFound = registeredUsers.any((user) =>
        user['email'] == email && user['password'] == password);

    if (userFound) {
      showSuccessMessage("Login realizado com sucesso!");
      // Navegar para a página principal ou de menu após login
      Navigator.pushNamed(context, 'MenuPage');
    } else {
      showErrorMessage("Email ou senha incorretos. Tente novamente.");
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

  Widget customTextField(TextEditingController controller, String labelText, String hintText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(color: Color(0x8FFFFFFF)),
            border: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFFFFFFFF)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFC99856),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFC99856)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          style: const TextStyle(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: screenWidth,
                  height: screenHeight * 0.4,
                  fit: BoxFit.cover,
                ),

                // TÍTULO LOGIN
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
                      const Text(
                        'Log In',
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
                customTextField(emailController, 'Email', 'Informe seu email', false),

                const SizedBox(height: 18),
                customTextField(passwordController, 'Senha', 'Informe sua senha', true),

                // ESQUECEU A SENHA?
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'PasswordRecoveryPage');
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Esqueceu a senha?',
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

                // BOTÃO LOGIN
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
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
                          onPressed: loginUser,
                          child: const Text(
                            'Log In',
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
