import 'package:flutter/material.dart';

// Classe para representar um item no carrinho
class CartItem {
  final String productName;
  final String productImage;
  int quantity;
  final double price;

  CartItem({
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.price,
  });
}

// Lista global para armazenar itens do carrinho
List<CartItem> cartItems = [];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
              child: const Text(
                'Carrinho de Compras',
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
              child: cartItems.isEmpty
                  ? const Center(
                      child: Text(
                        'Seu carrinho está vazio',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return _buildCartItem(item, index);
                      },
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
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontFamily: 'InriaSerif',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'R\$ ${_calculateTotal().toStringAsFixed(2)}',
                        style: const TextStyle(
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
                      // Ação para mostrar resumo do pedido
                      _showOrderSummary();
                    },
                    child: const Text(
                      'Finalizar Pedido',
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
  Widget _buildCartItem(CartItem item, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              item.productImage,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            // Detalhes do Produto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: const TextStyle(
                      fontFamily: 'InriaSerif',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Qtd: ${item.quantity}',
                    style: const TextStyle(
                      fontFamily: 'InriaSerif',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'R\$ ${(item.price * item.quantity).toStringAsFixed(2)}',
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
                _removeItemFromCart(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Função para calcular o total do carrinho
  double _calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  // Função para remover item do carrinho
  void _removeItemFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  // Função para mostrar resumo do pedido
  void _showOrderSummary() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Resumo do Pedido'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Lista de produtos no resumo
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Text(
                      '${item.productName} - Qtd: ${item.quantity} - R\$ ${(item.price * item.quantity).toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16),
                    );
                  },
                ),
                const SizedBox(height: 10),
                // Total do pedido
                Text(
                  'Total: R\$ ${_calculateTotal().toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o resumo do pedido
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _confirmOrder();
              },
              child: const Text('Confirmar Pedido'),
            ),
          ],
        );
      },
    );
  }

  // Função para confirmar o pedido
  void _confirmOrder() {
    Navigator.of(context).pop(); // Fecha o resumo do pedido
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pedido Realizado'),
          content: const Text('Pedido realizado com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha a mensagem de sucesso
                _showRatingPrompt(); // Chama a função para perguntar sobre a avaliação
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Função para perguntar ao usuário se deseja avaliar o pedido
  void _showRatingPrompt() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Avaliar Pedido'),
          content: const Text('Você gostaria de avaliar seu pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha a pergunta
                Navigator.pushNamed(context, 'RatingPage'); // Navega para a página de avaliação
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha a pergunta
              },
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
  }
}
