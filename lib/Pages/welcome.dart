import 'package:flutter/material.dart';
import 'dart:async';
import 'package:kiddie/models/Animation/TweenAnimation.dart';
import 'package:kiddie/Pages/onboarding_pages/FirstPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static String id = "WelcomePage";

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FirstPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/firstPages/logo.png",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimation(
                child: const Text(
                  'k',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Playfair Display',
                    color: Colors.blue,
                  ),
                ),
              ),
              TweenAnimation(
                child:
                    Image.asset("assets/images/firstPages/pin.png", height: 60),
              ),
              TweenAnimation(
                child: const Text(
                  'dd',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Playfair Display',
                    color: Colors.orange,
                  ),
                ),
              ),
              TweenAnimation(
                child:
                    Image.asset("assets/images/firstPages/pin.png", height: 60),
              ),
              TweenAnimation(
                child: const Text(
                  'e',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Playfair Display',
                    color: Colors.pink,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
