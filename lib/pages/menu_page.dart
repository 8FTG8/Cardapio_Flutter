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
                    Text(
                      productDescription,
                      style: const TextStyle(color: Colors.white),
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
        child: ListView(
          children: [
            // Adicione seus itens do menu aqui
            _buildMenuItem('Medalhão de Filet Mignon au Poivre', 'assets/images/your_image.png', 'Delicioso medalhão grelhado com molho especial.'),
            // Adicione mais itens conforme necessário
          ],
        ),
      ),
    );
  }
}
