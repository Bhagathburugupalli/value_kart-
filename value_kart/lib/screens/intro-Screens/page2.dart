import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: const Color(0xFF3b5999).withOpacity(.85),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Lottie.asset(
              'animations/Animation - 1706941585400.json', // Replace with your image file path
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Secure payments',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
