import 'package:flutter/material.dart';
import 'package:app_flutter/pages/cart_page.dart';
import 'package:app_flutter/widgets/divider.dart';
import 'package:app_flutter/widgets/food_card.dart';
import 'package:app_flutter/widgets/nav_bar.dart';
import 'product_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF1C343D),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    _buildCategory("Entradas",   _entradas()),
                    _buildCategory("Pratos",     _pratosPrincipais()),
                    _buildCategory("Sobremesas", _sobremesas()),
                    _buildCategory("Drinks",     _drinks()),
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
            _currentIndex = index;
          });
        }
      ),
    );
  }

  Widget _buildCategory(String title, List<ProductCard> products) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DividerLabel(label: title),
          Column(children: products),
        ],
      ),
    );
  }
  
  // ---------- ENTRADAS ---------- \\
  List<ProductCard> _entradas() {
    return [
      ProductCard(
        name: "Tagliatelle alla Crème Parmesan",
        price: "\$58",
        image: 'assets/images/entrada_1.png',
        backgroundColor: const Color(0xFF5B3B09),
        onTap: () => _navigateToProductDetails(
          context, 
          'Tagliatelle alla Crème Parmesan', 
          'Delicious pasta with parmesan sauce.', 
          'assets/images/entrada_1.png',
        ),
      ),
      ProductCard(
        name: "Medalhão de Filet Mignon au Poivre",
        price: "\$64",
        image: 'assets/images/entrada_2.png',
        backgroundColor: const Color(0xFF5B3B09),
        onTap: () => _navigateToProductDetails(
          context,
          "Medalhão de Filet Mignon au Poivre",
          "Juicy filet mignon with pepper sauce.",
          'assets/images/entrada_2.png',
        ),
      ),
    ];
  }
  
  // ---------- PRATOS PRINCIPAIS ---------- \\
  List<ProductCard> _pratosPrincipais() {
    return [
      ProductCard(
        name: "Frango Grelhado com Aspargos",
        price: "\$83",
        image: 'assets/images/prato_1.png',
        backgroundColor: Color(0xFF021803),
        onTap: () => _navigateToProductDetails(
          context, 
          'Medalhão de Filet Mignon au Poivre', 
          'Juicy filet mignon with pepper sauce.', 
          'assets/images/prato_1.png'
        ),
      ),
      ProductCard(
        name: "Filet Mignon com Aspargos",
        price: "\$97",
        image: 'assets/images/prato_2.png',
        backgroundColor: Color(0xFF021803),
        onTap: () => _navigateToProductDetails(
          context, 
          'Filet Mignon com Aspargos', 
          'Succulent filet mignon with asparagus.',
          'assets/images/prato_2.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/prato_3.png',
        backgroundColor: Color(0xFF021803),
        onTap: () => _navigateToProductDetails(
          context, 
          'Name', 
          'Description.',
          'assets/images/prato_3.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/prato_4.png',
        backgroundColor: Color(0xFF021803),
        onTap: () => _navigateToProductDetails(
          context, 
          'Name', 
          'Description.',
          'assets/images/prato_4.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/prato_5.png',
        backgroundColor: Color(0xFF021803),
        onTap: () => _navigateToProductDetails(
          context, 
          'Name', 
          'Description.',
          'assets/images/prato_5.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/prato_6.png',
        backgroundColor: Color(0xFF021803),
        onTap: () => _navigateToProductDetails(
          context, 
          'Name', 
          'Description.',
          'assets/images/prato_6.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/prato_7.png',
        backgroundColor: Color(0xFF021803),
        onTap: () => _navigateToProductDetails(
          context, 
          'Name', 
          'Description.',
          'assets/images/prato_7.png',
        ),
      ),
    ];
  }

  // ---------- SOBREMESAS ---------- \\
  List<ProductCard> _sobremesas() {
    return [
      ProductCard(
        name: "Title",
        price: "\$83",
        image: 'assets/images/sobremesa_1.png',
        backgroundColor: Color(0x62760276),
        onTap: () => _navigateToProductDetails(
          context, 
          "Sobremesa 1", 
          "Delicious dessert.", 
          'assets/images/sobremesa_1.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$97",
        image: 'assets/images/sobremesa_2.png',
        backgroundColor: Color(0x62760276),
        onTap: () => _navigateToProductDetails(
          context, 
          "Sobremesa 2", 
          "Delicious dessert.", 
          'assets/images/sobremesa_2.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$83",
        image: 'assets/images/sobremesa_3.png',
        backgroundColor: Color(0x62760276),
        onTap: () => _navigateToProductDetails(
          context, 
          "Sobremesa 3", 
          "Delicious dessert.", 
          'assets/images/sobremesa_3.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$83",
        image: 'assets/images/sobremesa_4.png',
        backgroundColor: Color(0x62760276),
        onTap: () => _navigateToProductDetails(
          context, 
          "Sobremesa 4", 
          "Delicious dessert.", 
          'assets/images/sobremesa_4.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$83",
        image: 'assets/images/sobremesa_5.png',
        backgroundColor: Color(0x62760276),
        onTap: () => _navigateToProductDetails(
          context, 
          "Sobremesa 5", 
          "Delicious dessert.", 
          'assets/images/sobremesa_5.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$83",
        image: 'assets/images/sobremesa_6.png',
        backgroundColor: Color(0x62760276),
        onTap: () => _navigateToProductDetails(
          context, 
          "Sobremesa 6", 
          "Delicious dessert.", 
          'assets/images/sobremesa_6.png',
        ),
      ),
    ];
  }

  // ---------- DRINKS ---------- \\
  List<ProductCard> _drinks() {
    return [
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/drink_1.png',
        backgroundColor: Color(0xFF4A0009),
        onTap: () => _navigateToProductDetails(
          context, 
          "Drink 1", 
          "Refreshing drink.", 
          'assets/images/drink_1.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/drink_2.png',
        backgroundColor: Color(0xFF4A0009),
        onTap: () => _navigateToProductDetails(
          context, 
          "Drink 2", 
          "Refreshing drink.", 
          'assets/images/drink_2.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/drink_3.png',
        backgroundColor: Color(0xFF4A0009),
        onTap: () => _navigateToProductDetails(
          context, 
          "Drink 3", 
          "Refreshing drink.", 
          'assets/images/drink_3.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/drink_4.png',
        backgroundColor: Color(0xFF4A0009),
        onTap: () => _navigateToProductDetails(
          context, 
          "Drink 4", 
          "Refreshing drink.", 
          'assets/images/drink_4.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/drink_5.png',
        backgroundColor: Color(0xFF4A0009),
        onTap: () => _navigateToProductDetails(
          context, 
          "Drink 5", 
          "Refreshing drink.", 
          'assets/images/drink_5.png',
        ),
      ),
      ProductCard(
        name: "Title",
        price: "\$00",
        image: 'assets/images/drink_6.png',
        backgroundColor: Color(0xFF4A0009),
        onTap: () => _navigateToProductDetails(
          context, 
          "Drink 6", 
          "Refreshing drink.", 
          'assets/images/drink_6.png',
        ),
      ),
    ];
  }

  // FUNÇÃO DE NAVEGAÇÃO
  void _navigateToProductDetails(BuildContext context, String productName, String productDescription, String productImage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(
          productName: productName, 
          productDescription: productDescription, 
          productImage: productImage, 
          rating: 4.8, 
          orders: 86, 
          isPopular: true,
        ),
      ),
    );
  }
}