import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

import 'package:app_flutter/pages/recovery_page.dart';
import 'package:app_flutter/pages/rating_page.dart';
import 'package:app_flutter/pages/suport_page.dart';

import 'pages/start_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/menu_page.dart';
import 'pages/cart_page.dart';
import 'pages/product_details_page.dart';

// Definição global de usuários registrados
List<Map<String, String>> registeredUsers = []; 

// Estrutura do carrinho para armazenar produtos selecionados
List<Map<String, dynamic>> cartItems = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(
    DevicePreview(
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'InriaSerif'),
      debugShowCheckedModeBanner: false,
      initialRoute: 'StartPage',
      routes: {
        'StartPage': (context) => StartPage(),
        'LoginPage': (context) => LoginPage(),
        'SignUpPage': (context) => SignUpPage(),
        'MenuPage': (context) => MenuPage(),
        'PasswordRecoveryPage': (context) => PasswordRecoveryPage(),
        'SupportPage': (context) => SupportPage(),
        'RatingPage': (context) => RatingPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == 'ProductDetailsPage') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              productName:          args['productName'],
              productDescription:   args['productDescription'],
              productImage:         args['productImage'],
              rating:               args['rating'],
              orders:               args['orders'],
              isPopular:            args['isPopular'],
            ),
          );
        }
        return null;
      },
      builder: (context, child) {
        return Scaffold(
          drawer: const CartPage(), // Adiciona o drawer do carrinho
          body: child,
        );
      },
    );
  }
}
