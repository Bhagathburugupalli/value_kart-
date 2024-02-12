import 'package:flutter/material.dart';
import 'package:value_kart/screens/ProfilePage.dart';
import 'package:value_kart/screens/login_signup.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(""),
                fit: BoxFit.fill,
              ),
              color: const Color(0xFF3b5999).withOpacity(.85),
            ),
            child: const Text(
              'Your Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Handle profile tap
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              ); // Close the drawer
              // Add your profile navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Your Orders'),
            onTap: () {
              // Handle orders tap
              Navigator.pop(context); // Close the drawer
              // Add your orders navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Address'),
            onTap: () {
              // Handle address tap
              Navigator.pop(context); // Close the drawer
              // Add your address navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Customer Care'),
            onTap: () {
              // Handle address tap
              Navigator.pop(context); // Close the drawer
              // Add your address navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Handle logout tap
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginSignupScreen(),
                  // Close the drawer
                ),
              ); // Add your logout logic here
            },
          ),
        ], // Close children
      ), // Close ListView
    ); // Close Drawer
  } // Close build method
} // Close class AppDrawer
