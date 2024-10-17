import 'package:app_flutter/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/food_card.dart';
import 'package:app_flutter/widgets/nav_bar.dart';
import 'package:app_flutter/widgets/gradient_background.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0; // Índice atual da navegação

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
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

                    //ENTRADAS
                    SizedBox(height: 12),
                    DividerLabel(label: 'Entradas'),
                    _buildProductGrid([
                      ProductCard(
                        name: "Tagliatelle alla Crème Parmesan",
                        price: "\$58",
                        image: 'assets/images/entrada_1.png',
                        backgroundColor: Color(0xFF5B3B09),
                      ),
                      ProductCard(
                        name: "Medalhão de Filet Mignon au Poivre",
                        price: "\$64",
                        image: 'assets/images/entrada_2.png',
                        backgroundColor: Color(0xFF5B3B09),
                      ),
                    ]),

                    //PRATOS
                    SizedBox(height: 16),
                    DividerLabel(label: 'Pratos'),
                    _buildProductGrid([
                      ProductCard(
                        name: "Frango Grelhado com Aspargos",
                        price: "\$83",
                        image: 'assets/images/prato_1.png',
                        backgroundColor: Color(0xFF021803),
                      ),
                      ProductCard(
                        name: "Filet Mignon com Aspargos",
                        price: "\$97",
                        image: 'assets/images/prato_2.png',
                        backgroundColor: Color(0xFF021803),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_3.png',
                        backgroundColor: Color(0xFF021803),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_4.png',
                        backgroundColor: Color(0xFF021803),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_5.png',
                        backgroundColor: Color(0xFF021803),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_6.png',
                        backgroundColor: Color(0xFF021803),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_7.png',
                        backgroundColor: Color(0xFF021803),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_8.png',
                        backgroundColor: Color(0xFF021803),
                      ),
                    ]),

                    //SOBREMESAS
                    SizedBox(height: 16),
                    DividerLabel(label: 'Sobremesas'),
                    _buildProductGrid([
                      ProductCard(
                        name: "Title",
                        price: "\$83",
                        image: 'assets/images/sobremesa_1.png',
                        backgroundColor: Color(0x62760276),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$97",
                        image: 'assets/images/sobremesa_2.png',
                        backgroundColor: Color(0x62760276),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/sobremesa_3.png',
                        backgroundColor: Color(0x62760276),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/sobremesa_4.png',
                        backgroundColor: Color(0x62760276),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/sobremesa_5.png',
                        backgroundColor: Color(0x62760276),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/sobremesa_6.png',
                        backgroundColor: Color(0x62760276),
                      ),
                    ]),

                    //DRINKS
                    SizedBox(height: 16),
                    DividerLabel(label: 'Drinks'),
                    _buildProductGrid([
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_1.png',
                        backgroundColor: Color(0xFF4A0009),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_2.png',
                        backgroundColor: Color(0xFF4A0009),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_3.png',
                        backgroundColor: Color(0xFF4A0009),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_4.png',
                        backgroundColor: Color(0xFF4A0009),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_5.png',
                        backgroundColor: Color(0xFF4A0009),
                      ),
                      ProductCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_6.png',
                        backgroundColor: Color(0xFF4A0009),
                      ),
                    ]),
                    SizedBox(height: 18),
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

          switch (index) {
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
              break;
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
