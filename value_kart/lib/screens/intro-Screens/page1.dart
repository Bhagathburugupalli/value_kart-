import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: const Color(0xFF3b5999).withOpacity(.85),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'animations/Animation - 1706941740855.json',
            height: 300,
            width: 300,
          ),
          const SizedBox(
              height: 20), // Adjust the spacing between image and text
          const Text(
            '5000+ products available',
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
