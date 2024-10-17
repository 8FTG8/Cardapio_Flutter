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
            _buildCategoryTabs(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    DividerLabel(label: 'Entradas'),

                    _buildProductGrid([
                      ProductCard(
                        name: "Tagliatelle alla Crème Parmesan",
                        price: "\$42",
                        image: 'assets/images/entrada_1.png',
                        backgroundColor: Colors.yellow,
                      ),
                      ProductCard(
                        name: "Medalhão de Filet Mignon au Poivre",
                        price: "\$42",
                        image: 'assets/images/entrada_2.png',
                        backgroundColor: Colors.yellow,
                      ),
                    ]),

                    DividerLabel(label: 'Pratos'),

                    _buildProductGrid([
                      ProductCard(
                        name: "Frango Grelhado com Aspargos",
                        price: "\$42",
                        image: 'assets/images/prato_1.png',
                        backgroundColor: Colors.green,
                      ),
                      ProductCard(
                        name: "Filet Mignon com Aspargos",
                        price: "\$42",
                        image: 'assets/images/prato_2.png',
                        backgroundColor: Colors.green,
                      ),
                      // Adicione mais ProductCard aqui conforme necessário
                    ]),
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

          // Lógica para navegação baseada no índice
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
              break;
            // Adicione casos para outras páginas
            /*case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
              break;*/
          }
        },
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCategoryTab("Entradas", isActive: true),
          _buildCategoryTab("Pratos"),
          _buildCategoryTab("Sobremesas"),
          _buildCategoryTab("Drinks"),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String title, {bool isActive = false}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isActive ? Colors.white : Colors.white70,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _buildProductGrid(List<Widget> productCards) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
