import 'package:flutter/material.dart';
import 'package:value_kart/screens/StorePage.dart';
import 'package:value_kart/screens/WishlistPage.dart';
import 'package:value_kart/screens/cart.dart';
import 'package:value_kart/screens/intro-Screens/HomePage.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        // Navigate to the home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
        break;
      case 1:
        // Navigate to the wishlist page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WishlistPage()),
        );
        break;
      case 2:
        // Navigate to the cart page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
        break;
      case 3:
        // Navigate to the store page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StorePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store), // Change icon to store
          label: 'Store',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor:
          const Color(0xFF3b5999).withOpacity(.85), // Set selected icon color
      unselectedItemColor:
          Color.fromARGB(255, 73, 72, 72), // Set unselected icon color
      onTap: _onItemTapped,
    );
  }
}
