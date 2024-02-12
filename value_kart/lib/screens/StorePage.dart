import 'package:flutter/material.dart';
import 'package:value_kart/widgets/CustomBottomNavigationBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StorePage(),
    );
  }
}

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            title: Text('Electronics'),
            onTap: () {
              // Navigate to electronics category
            },
          ),
          ListTile(
            title: Text('Books'),
            onTap: () {
              // Navigate to books category
            },
          ),
          ListTile(
            title: Text('Sports'),
            onTap: () {
              // Navigate to clothing category
            },
          ),
          // Add more categories as needed
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
