import 'package:flutter/material.dart';
import 'package:value_kart/screens/intro-Screens/page1.dart';
import 'intro-Screens/page2.dart';
import 'intro-Screens/page3.dart';
import 'login_signup.dart';

class onboardingscreen extends StatefulWidget {
  const onboardingscreen({Key? key}) : super(key: key);

  @override
  _onboardingscreenState createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {
  PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            children: [Page1(), Page2(), Page3()],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LoginSignupScreen();
                      }),
                    );
                  },
                  child: const Text(
                    'skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Text(
                    'next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
