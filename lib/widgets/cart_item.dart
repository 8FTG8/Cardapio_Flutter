


/* 


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
  } */