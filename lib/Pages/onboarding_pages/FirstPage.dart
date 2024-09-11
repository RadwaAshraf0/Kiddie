// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/onboarding_pages/secondPage.dart';
import 'package:kiddie/models/onboardingModel.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  static String id = 'FirstPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: OnboardingModel(
        image: ('assets/images/firstPages/FirstPage.png'),
        text1: 'Unlock Your child\'s potential',
        color: const Color.fromARGB(255, 202, 191, 249),
        color2: const Color.fromARGB(255, 212, 207, 229),
        color3: const Color.fromARGB(255, 183, 166, 249),
        color4: const Color.fromARGB(255, 152, 129, 244),
        onpressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SecondPage();
          }));
        },
      ),
    );
  }
}
