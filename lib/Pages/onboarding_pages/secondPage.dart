// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/onboarding_pages/ThirdPage.dart';
import 'package:kiddie/models/onboardingModel.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  static String id = 'SecondPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingModel(
        image: ('assets/images/firstPages/secoundPage.png'),
        text1: 'Nurture curiosity, ignite.',
        color: const Color(0xffBAE3FF),
        color2: const Color.fromARGB(255, 112, 192, 245),
        color3: const Color.fromARGB(255, 212, 207, 229),
        color4: const Color.fromARGB(255, 46, 163, 242),
        onpressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ThirdPage();
          }));
        },
      ),
    );
  }
}
