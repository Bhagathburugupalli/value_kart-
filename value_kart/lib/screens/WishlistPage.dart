import 'package:flutter/material.dart';
import 'package:value_kart/widgets/CustomBottomNavigationBar.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price});
}

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Product> _wishlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: _wishlist.isEmpty
          ? Center(
              child: Text('Your wishlist is empty.'),
            )
          : ListView.builder(
              itemCount: _wishlist.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_wishlist[index].name),
                  subtitle: Text(_wishlist[index].description),
                  trailing:
                      Text('\$${_wishlist[index].price.toStringAsFixed(2)}'),
                  onTap: () {
                    // Navigate to the product details screen or perform any other action
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Simulate adding a product to the wishlist
          final newProduct = Product(
            id: DateTime.now().toString(),
            name: 'Product ${_wishlist.length + 1}',
            description: 'Description of Product ${_wishlist.length + 1}',
            price: 10.0,
          );
          setState(() {
            _wishlist.add(newProduct);
          });
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
