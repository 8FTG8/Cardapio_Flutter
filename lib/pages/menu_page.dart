import 'package:flutter/material.dart';
import 'product_details_page.dart'; // Certifique-se de importar a página de detalhes do produto

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override 
  State<MenuPage> createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {

  // Método para construir um item do menu
  Widget _buildMenuItem(String productName, String productImage, String productDescription) {
    return GestureDetector(
      onTap: () {
        // Navega para a tela de detalhes do produto ao clicar
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              productName: productName,
              productDescription: productDescription,
              productImage: productImage,
              rating: 4.8,
              orders: 2000,
              isPopular: true,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                productImage,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      productDescription,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF478197),
              Color(0xFF1C343D),
              Color(0xFF172A31),
            ],
          ),
        ),
        child: ListView(
          children: [
            _buildMenuItem(
              'Produto 1',
              'assets/images/produto1.png',
              'Descrição do Produto 1',
            ),
            _buildMenuItem(
              'Produto 2',
              'assets/images/produto2.png',
              'Descrição do Produto 2',
            ),
            // Adicione mais produtos conforme necessário
          ],
        ),
      ),
    );
  }
}
