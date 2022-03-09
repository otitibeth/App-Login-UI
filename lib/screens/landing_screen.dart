import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_page_ui/screens/login_screen.dart';
import 'package:login_page_ui/screens/register_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  Widget buildTextButton(String text, Function() onPressed) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            colors: [Colors.amberAccent, Colors.yellow, Colors.deepOrange]),
      ),
      child: TextButton(onPressed: onPressed, child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/happy.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'LOgIfY',
                      style: TextStyle(
                          fontFamily: 'Charm',
                          fontSize: 70,
                          fontWeight: FontWeight.w900,
                          color: Colors.deepOrange),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Create Your Style',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Style is something we all have,',
                      softWrap: true,
                      style: TextStyle(color: Colors.white70),
                    ),
                    const Text(
                      'all we need to do is find it.',
                      softWrap: true,
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Get Started Now!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      softWrap: true,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 70, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTextButton(
                              'Signup',
                              () => Navigator.of(context)
                                  .pushNamed(RegisterScreen.routeName),
                            ),
                            const SizedBox(width: 25),
                            buildTextButton(
                              'Login',
                              () => Navigator.of(context)
                                  .pushNamed(LoginScreen.routeName),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
