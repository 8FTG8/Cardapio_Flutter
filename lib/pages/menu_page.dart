import 'package:app_flutter/pages/cart_page.dart';
import 'package:app_flutter/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/food_card.dart';
import 'package:app_flutter/widgets/nav_bar.dart';
import 'package:app_flutter/widgets/gradient_background.dart';

import 'pages/product_details_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0; // Índice atual da navegação

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CartPage(), // Certifique-se de que CartPage é um Drawer ou ajustável
      body: GradientBackground(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer(); // Abre o Drawer
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Entradas
                    const SizedBox(height: 12),
                    DividerLabel(label: 'Entradas'),
                    _buildProductGrid([
                      ProductCard(
                        name: "Tagliatelle alla Crème Parmesan",
                        price: "\$58",
                        image: 'assets/images/entrada_1.png',
                        backgroundColor: const Color(0xFF5B3B09),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Tagliatelle alla Crème Parmesan",
                                productDescription: "Delicious pasta with parmesan sauce.",
                                productImage: 'assets/images/entrada_1.png',
                                rating: 4.5,
                                orders: 120,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      ProductCard(
                        name: "Medalhão de Filet Mignon au Poivre",
                        price: "\$64",
                        image: 'assets/images/entrada_2.png',
                        backgroundColor: const Color(0xFF5B3B09),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Medalhão de Filet Mignon au Poivre",
                                productDescription: "Juicy filet mignon with pepper sauce.",
                                productImage: 'assets/images/entrada_2.png',
                                rating: 4.8,
                                orders: 85,
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
                    // Mais categorias comentadas (Pratos, Sobremesas, Drinks)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Atualiza o índice atual
          });
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildProductGrid(List<Widget> productCards) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemCount: productCards.length,
        itemBuilder: (context, index) {
          return productCards[index];
        },
      ),
    );
  }
}
