import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {"name": "Product 1", "quantity": 2, "price": 20.0},
    {"name": "Product 2", "quantity": 1, "price": 15.0},
    // Add more items to the cart as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('Your cart is empty.'),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle: Text('Quantity: ${item['quantity']}'),
                    trailing: Text('\Rs${item['price']}'),
                  ),
                );
              },
            ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : BottomAppBar(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \RS${calculateTotal()}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement checkout logic
                        // You can navigate to a checkout page or perform other actions
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['quantity'] * item['price'];
    }
    return total;
  }
}
