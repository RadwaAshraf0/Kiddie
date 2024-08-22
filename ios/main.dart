import 'package:flutter/material.dart';
import 'package:kiddie/Pages/welcome.dart';

void main() {
  runApp(const Kiddie());
}

class Kiddie extends StatelessWidget {
  const Kiddie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  "WelcomePage",
      routes: {
        "WelcomePage":(context) => const WelcomePage(),
      },
    );}}