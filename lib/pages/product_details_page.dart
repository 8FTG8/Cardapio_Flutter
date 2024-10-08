import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String productImage;
  final double rating;
  final int orders;
  final bool isPopular;

  const ProductDetailsPage({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.rating,
    required this.orders,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Imagem do produto
                  Image.asset(
                    productImage,
                    width: screenWidth,
                    height: screenHeight * 0.4,
                    fit: BoxFit.cover,
                  ),

                  // Ícone de "coração" e botão de voltar
                  Positioned(
                    top: 40,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 16,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.white),
                      onPressed: () {
                        // Lógica para adicionar aos favoritos
                      },
                    ),
                  ),
                ],
              ),

              // Título do produto e detalhes
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Seção de "Popular"
                    if (isPopular)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Popular',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    const SizedBox(height: 8),

                    // Nome do produto
                    Text(
                      productName,
                      style: const TextStyle(
                        fontFamily: 'InriaSerif',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC99856),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Avaliação e número de pedidos
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFC99856), size: 20),
                        const SizedBox(width: 4),
                        Text(
                          '$rating Rating',
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '$orders+ Orders',
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Descrição do produto
                    Text(
                      productDescription,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    
                    // Botão "Adicionar ao Carrinho"
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xC8000000),
                          minimumSize: const Size(318, 54),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Lógica para adicionar ao carrinho
                        },
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontFamily: 'InriaSerif',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFFC99856),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1C343D),
        selectedItemColor: const Color(0xFFC99856),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
