import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:kiddie/Pages/Home_Pages/Basics_Pages/alphabet_page.dart';
import 'package:kiddie/Pages/Home_Pages/Basics_Pages/categoriesBasics_page.dart';
import 'package:kiddie/Pages/Home_Pages/Basics_Pages/numbers_page.dart';
import 'package:kiddie/Pages/Home_Pages/words_page/categoriesWords_page.dart';
import 'package:kiddie/Pages/Profile_Pages/edite-profile.dart';
import 'package:kiddie/Pages/Home_Pages/home_page.dart';
import 'package:kiddie/Pages/Profile_Pages/profile_page.dart';
import 'package:kiddie/Pages/setting_page.dart';
import 'package:kiddie/Pages/Registration/signup_page.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/forgetPassword_page.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/new_password_page.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/sendCode_page.dart';
import 'package:kiddie/Pages/onboarding_pages/FirstPage.dart';
import 'package:kiddie/Pages/onboarding_pages/ThirdPage.dart';
import 'package:kiddie/Pages/onboarding_pages/secondPage.dart';
import 'package:kiddie/Pages/Registration/SignIn_page.dart';
import 'package:kiddie/Pages/welcome.dart';

void main() {
  runApp( DevicePreview(
    enabled: !kReleaseMode,
    builder: (context)=> const Kiddie()));
}

class Kiddie extends StatelessWidget {
  const Kiddie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute:  "WelcomePage",
      routes: {
        "WelcomePage":(context) =>   const WelcomePage(),
        "FirstPage":(context) => const FirstPage(),
        "SecoundPage":(context) => const SecondPage(),
        "ThirdPage":(context) => const ThirdPage(),
        "SignIn":(context) => const SignIn(),
        "SignUp":(context) => const Signup(),
        "forgetPassword":(context) =>  forgetPassword(),
        "sendCode":(context) =>  const sendCode(),
        "newPassword":(context) => newPassword(),
        "HomePage":(context) => const HomePage(),
        "ProfilePage":(context) => const ProfilePage(),
        "SettingPage":(context) => const SettingPage(),
        "EditeProfile":(context) => Edite_profile(),
        "bacsics_categories": (context) => const bacsics_categories(),
        "numbers_page": (context) =>  numbers_page(),
        "alphabet_page": (context) => alphabet_page(),
        "words_categories": (context) =>const words_categories(),



      },
    );}}