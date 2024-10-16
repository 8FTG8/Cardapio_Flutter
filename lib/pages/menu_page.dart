import 'package:app_flutter/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
//import 'product_details_page.dart';
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override 
  State<MenuPage> createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  Widget _buildMenuItem(String productName, String productImage, String productDescription) {
    return GestureDetector(
      onTap: () {
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: GridView(
          children: [
            _buildMenuItem(
              'Nome',
              'assets/images/entrada_1.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/entrada_2.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/prato_1.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/prato_2.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/prato_3.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/prato_4.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/prato_5.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/prato_6.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/prato_7.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/prato_8.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/drink_1.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/drink_2.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/drink_3.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/drink_4.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/drink_5.png',
              'Descrição',
            ),
            _buildMenuItem(
              'Nome',
              'assets/images/drink_6.png',
              'Descrição',
            ),
          ],
        ),
      ),
    );
  }
}


//BOTÃO PARA SELECIONAR ICONE DA SIDE BAR DO CARRINHO (SO PRA DEIXAR
//ANOTADO PRO FELIPE)

//appBar: AppBar(
//  title: Text("Menu"),
//  backgroundColor: const Color(0xFF1C343D),
//  actions: [
//    IconButton(
//      icon: Icon(Icons.shopping_cart),
//      onPressed: () {
//        Scaffold.of(context).openDrawer();
//      },
//    ),
//  ],
//),
