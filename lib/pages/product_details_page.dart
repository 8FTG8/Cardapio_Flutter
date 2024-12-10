import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/gradient_background.dart';
import 'cart_page.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productName;
  final String productDescription;
  final String productImage;
  final double rating;
  final int orders;
  final bool isPopular;

  const ProductDetailsPage({
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.rating,
    required this.orders,
    required this.isPopular,
    super.key,
  });

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1; // Quantidade inicial

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    widget.productImage,
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
                    if (widget.isPopular)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Popular',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    const SizedBox(height: 8),

                    // Nome do produto
                    Text(
                      widget.productName,
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
                          '${widget.rating} Rating',
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '${widget.orders}+ Orders',
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Descrição do produto
                    Text(
                      widget.productDescription,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 24),

                    // Seção para selecionar a quantidade
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                        ),
                        Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),

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
                          // Adiciona o produto ao carrinho
                          cartItems.add(CartItem(
                            productName: widget.productName,
                            productImage: widget.productImage,
                            quantity: quantity,
                            price: 20.0, // Substitua pelo preço real do produto
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$quantity ${widget.productName} adicionado ao carrinho!'),
                            ),
                          );
                        },
                        child: const Text('Add to Cart',
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
    );
  }
}
