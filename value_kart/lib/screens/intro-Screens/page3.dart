import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page3 extends StatelessWidget {
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
              'animations/Animation - 1706941999426.json', // Replace with your image file path
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
              height: 20), // Adjust the spacing between image and text
          const Text(
            'Home Delivery',
            style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 255, 254, 254),
            ),
          ),
        ],
      ),
    );
  }
}
