import 'package:app_flutter/pages/recovery_page.dart';
import 'package:app_flutter/pages/rating_page.dart';
import 'package:app_flutter/pages/suport_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pages/start_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/menu_page.dart';
import 'pages/product_details_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Habilita apenas em modo de desenvolvimento
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
              productName: args['productName'],
              productDescription: args['productDescription'],
              productImage: args['productImage'],
              rating: args['rating'],
              orders: args['orders'],
            ),
          );
        }
        return null; // Retorna null se a rota não for reconhecida
      },
    );
  }
}
