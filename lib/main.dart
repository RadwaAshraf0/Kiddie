import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:kiddie/Pages/Home_Pages/home_page.dart';
import 'package:kiddie/Pages/Home_Pages/profile_page.dart';
import 'package:kiddie/Pages/Home_Pages/setting_page.dart';
import 'package:kiddie/Pages/Registration/signup_page.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/forgetPassword_page.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/new_password_page.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/sendCode_page.dart';
import 'package:kiddie/Pages/onboarding_pages/FirstPage.dart';
import 'package:kiddie/Pages/onboarding_pages/ThirdPage.dart';
import 'package:kiddie/Pages/onboarding_pages/secondPage.dart';
import 'package:kiddie/Pages/Registration/SignIn.dart';
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
        "sendCode":(context) =>  sendCode(),
        "newPassword":(context) => newPassword(),
        "HomePage":(context) => HomePage(),
        "ProfilePage":(context) => ProfilePage(),
        "SettingPage":(context) => SettingPage(),



      },
    );}}