import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Save changes
                  String name = _nameController.text;
                  String phoneNumber = _phoneNumberController.text;
                  String address = _addressController.text;
                  String email = _emailController.text;
                  // Here you can handle saving the data to your database or perform any other action.
                  // For simplicity, we're just printing the data.
                  print('Name: $name');
                  print('Phone Number: $phoneNumber');
                  print('Address: $address');
                  print('Email: $email');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile updated')),
                  );
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
