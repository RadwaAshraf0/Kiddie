// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Registration/SignIn_page.dart';
import 'package:kiddie/models/onboardingModel.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});
static String id = 'ThirdPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  OnboardingModel(
       image: ('assets/images/firstPages/thirdPage.png'),
        text1: 'Empower Learing Through play.',
        color: const Color(0xffA2DDC2),
        color2: const Color.fromARGB(255, 16, 152, 91),
        color3: const Color.fromARGB(255, 76, 202, 145),
        color4: const Color.fromARGB(255, 212, 241, 228),
        onpressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SignIn();
          }));
        },
    ),
    );
  }
}