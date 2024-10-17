import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
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
        
        child: Column(
          children: [
            // Header do Carrinho
            Container(
              padding: const EdgeInsets.all(24.0),
              width: double.infinity,
              color: const Color(0xFF1C343D),
              child: const Text('Carrinho de Compras',
                style: TextStyle(
                  fontFamily: 'InriaSerif',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFFC99856),
                ),
              ),
            ),
            
            // Lista de Produtos no Carrinho
            Expanded(
              child: ListView(
                children: [
                  _buildCartItem('Produto 1', 'assets/images/prato_1.png', 2, 19.99),
                  _buildCartItem('Produto 2', 'assets/images/prato_2.png', 1, 49.99),
                  // Adicione mais itens de exemplo conforme necessário
                ],
              ),
            ),

            // Seção de Total e Finalizar Compra
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white, width: 0.5),
                ),
              ),
              child: Column(
                children: [
                  // Total do Carrinho
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontFamily: 'InriaSerif',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'R\$ 89.97',
                        style: TextStyle(
                          fontFamily: 'InriaSerif',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFFC99856),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Botão de Finalizar Compra
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC99856),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Ação para finalizar compra
                    },
                    child: const Text(
                      'Finalizar Compra',
                      style: TextStyle(
                        fontFamily: 'InriaSerif',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir cada item no carrinho
  Widget _buildCartItem(String productName, String productImage, int quantity, double price) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              productImage,
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),

            // Detalhes do Produto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontFamily: 'InriaSerif',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Qtd: $quantity',
                    style: const TextStyle(
                      fontFamily: 'InriaSerif',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'R\$ ${(price * quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontFamily: 'InriaSerif',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFFC99856),
                    ),
                  ),
                ],
              ),
            ),

            // Botão de Remover
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Ação para remover item do carrinho
              },
            ),
          ],
        ),
      ),
    );
  }
}
