import 'package:flutter/material.dart';
import 'package:value_kart/config/palette.dart';
import 'intro-Screens/HomePage.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  color: Color(0xFF3b5999).withOpacity(.85),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Welcome ",
                          style: const TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: const Color.fromARGB(255, 230, 228, 225),
                          ),
                          children: [
                            TextSpan(
                              text:
                                  isSignupScreen ? "to Value Kart," : " Back,",
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 231, 230, 225),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        isSignupScreen
                            ? "Signup to Continue"
                            : "Signin to Continue",
                        style: const TextStyle(
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Trick to add the shadow for the submit button
            buildBottomHalfContainer(true),
            // Main Container for Login and Signup
            AnimatedPositioned(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              top: isSignupScreen ? 150 : 230,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                height: isSignupScreen ? 400 : 250,
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (!isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (isSignupScreen) buildSignupSection(),
                      if (!isSignupScreen) buildSigninSection(),
                    ],
                  ),
                ),
              ),
            ),
            // Trick to add the submit button
            buildBottomHalfContainer(false),
            // Bottom buttons
            Positioned(
              top: MediaQuery.of(context).size.height - 100,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(isSignupScreen ? "Or Signup with" : "Or Signin with"),
                  Container(
                      margin:
                          const EdgeInsets.only(right: 20, left: 20, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextButton(
                              Icons.inbox_sharp, "Google", Palette.googleColor),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.mail_outline, "Email", false, true),
          buildTextField(Icons.lock_outline, "password", true, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  const Text(
                    "Remember me",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 12, color: Palette.textColor1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.account_box_outlined, "User Name", false, false),
          buildTextField(Icons.email_outlined, "email", false, true),
          buildTextField(Icons.lock_outline, "password", true, false),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color:
                              isMale ? Palette.textColor2 : Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? Colors.transparent
                                : Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.account_box_outlined,
                          color: isMale ? Colors.white : Palette.iconColor,
                        ),
                      ),
                      const Text(
                        "Male",
                        style: TextStyle(color: Palette.textColor1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color:
                              isMale ? Colors.transparent : Palette.textColor2,
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? Palette.textColor1
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.account_box_outlined,
                          color: isMale ? Palette.iconColor : Colors.white,
                        ),
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(color: Palette.textColor1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "By pressing 'Submit' you agree to our ",
                style: TextStyle(color: Palette.textColor2),
                children: [
                  TextSpan(
                    //recognizer: ,
                    text: "term & conditions",
                    style: TextStyle(color: Color.fromRGBO(84, 164, 218, 1)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.grey),
        minimumSize: const Size(145, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        primary: Colors.white,
        backgroundColor: backgroundColor,
      ),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
          ),
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 480 : 430,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (showShadow)
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  spreadRadius: 1.5,
                  blurRadius: 10,
                ),
            ],
          ),
          child: !showShadow
              ? GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, perform signup or register action
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 79, 44, 207),
                          Color.fromARGB(255, 76, 92, 216),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                )
              : Center(),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return '*Required';
          }
          if (isEmail && !isEmailValid(value)) {
            return 'Please enter a valid email address';
          }
          return null; // Return null if the input is valid
        },
      ),
    );
  }

  bool isEmailValid(String email) {
    // Regular expression for email validation
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Check if the email matches the regex pattern
    return emailRegex.hasMatch(email);
  }
}
