import 'package:app_flutter/pages/cart_page.dart';
import 'package:app_flutter/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/food_card.dart';
import 'package:app_flutter/widgets/nav_bar.dart';
import 'product_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CartPage(),
      body: Container(
        color: const Color(0xFF1C343D),
        child: Column(
          children: [
            /*AppBar(
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
            ),*/
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // Entradas
                    const SizedBox(height: 60),
                    DividerLabel(label: 'Entradas'),
                    _buildProductGrid([
                      FoodCard(
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
                      FoodCard(
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
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                    ]),

                    //PRATOS
                    SizedBox(height: 16),
                    DividerLabel(label: 'Pratos'),
                    _buildProductGrid([
                      FoodCard(
                        name: "Frango Grelhado com Aspargos",
                        price: "\$83",
                        image: 'assets/images/prato_1.png',
                        backgroundColor: Color(0xFF021803),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Medalhão de Filet Mignon au Poivre",
                                productDescription: "Juicy filet mignon with pepper sauce.",
                                productImage: 'assets/images/prato_1.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Filet Mignon com Aspargos",
                        price: "\$97",
                        image: 'assets/images/prato_2.png',
                        backgroundColor: Color(0xFF021803),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Medalhão de Filet Mignon au Poivre",
                                productDescription: "Juicy filet mignon with pepper sauce.",
                                productImage: 'assets/images/prato_2.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_3.png',
                        backgroundColor: Color(0xFF021803),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Medalhão de Filet Mignon au Poivre",
                                productDescription: "Juicy filet mignon with pepper sauce.",
                                productImage: 'assets/images/prato_3.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_5.png',
                        backgroundColor: Color(0xFF021803),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Medalhão de Filet Mignon au Poivre",
                                productDescription: "Juicy filet mignon with pepper sauce.",
                                productImage: 'assets/images/prato_6.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_5.png',
                        backgroundColor: Color(0xFF021803),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Medalhão de Filet Mignon au Poivre",
                                productDescription: "Juicy filet mignon with pepper sauce.",
                                productImage: 'assets/images/prato_7.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_6.png',
                        backgroundColor: Color(0xFF021803),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Medalhão de Filet Mignon au Poivre",
                                productDescription: "Juicy filet mignon with pepper sauce.",
                                productImage: 'assets/images/prato_8.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_7.png',
                        backgroundColor: Color(0xFF021803),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/entrada_2.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/prato_8.png',
                        backgroundColor: Color(0xFF021803),
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
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                    ]),

                    //SOBREMESAS
                    SizedBox(height: 16),
                    DividerLabel(label: 'Sobremesas'),
                    _buildProductGrid([
                      FoodCard(
                        name: "Title",
                        price: "\$83",
                        image: 'assets/images/sobremesa_1.png',
                        backgroundColor: Color(0x62760276),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/sobremesa_1.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$97",
                        image: 'assets/images/sobremesa_2.png',
                        backgroundColor: Color(0x62760276),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/sobremesa_2.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/sobremesa_3.png',
                        backgroundColor: Color(0x62760276),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/sobremesa_3.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/sobremesa_4.png',
                        backgroundColor: Color(0x62760276),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/sobremesa_4.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/sobremesa_5.png',
                        backgroundColor: Color(0x62760276),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/sobremesa_5.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/sobremesa_6.png',
                        backgroundColor: Color(0x62760276),
                         onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/sobremesa_6.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                    ]),

                    //DRINKS
                    SizedBox(height: 16),
                    DividerLabel(label: 'Drinks'),
                    _buildProductGrid([
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_1.png',
                        backgroundColor: Color(0xFF4A0009),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/drink_1.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_2.png',
                        backgroundColor: Color(0xFF4A0009),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/drink_2.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_3.png',
                        backgroundColor: Color(0xFF4A0009),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/drink_3.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_4.png',
                        backgroundColor: Color(0xFF4A0009),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/drink_4.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_5.png',
                        backgroundColor: Color(0xFF4A0009),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/drink_5.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                      FoodCard(
                        name: "Title",
                        price: "\$00",
                        image: 'assets/images/drink_6.png',
                        backgroundColor: Color(0xFF4A0009),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                productName: "Name",
                                productDescription: "Description.",
                                productImage: 'assets/images/drink_6.png',
                                rating: 4.8,
                                orders: 85,
                                isPopular: true,
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
                    SizedBox(height: 12),
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