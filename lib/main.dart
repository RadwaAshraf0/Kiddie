import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:kiddie/Pages/Home_Pages/Basics_Pages/alphabet_page.dart';
import 'package:kiddie/Pages/Home_Pages/Basics_Pages/categoriesBasics_page.dart';
import 'package:kiddie/Pages/Home_Pages/Basics_Pages/numbers_page.dart';
import 'package:kiddie/Pages/Home_Pages/activities_pages/level_one.dart';
import 'package:kiddie/Pages/Home_Pages/activities_pages/level_two.dart';
import 'package:kiddie/Pages/Home_Pages/activities_pages/levels_page.dart';
import 'package:kiddie/Pages/Home_Pages/words_pages/animals_page.dart';
import 'package:kiddie/Pages/Home_Pages/words_pages/categoriesWords_page.dart';
import 'package:kiddie/Pages/Home_Pages/words_pages/vegetables_page.dart';
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
import 'package:kiddie/firebase_options.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  name: "kiddie-ab777",
 );
  await FirebaseAppCheck.instance.activate();

  runApp(const Kiddie());
}



class Kiddie extends StatelessWidget {
  const Kiddie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute:"WelcomePage",
      routes: {
        "WelcomePage": (context) => const WelcomePage(),
        "FirstPage": (context) => const FirstPage(),
        "SecoundPage": (context) => const SecondPage(),
        "ThirdPage": (context) => const ThirdPage(),
        "SignIn": (context) => const SignIn(),
        "SignUp": (context) => const Signup(),
        "forgetPassword": (context) => forgetPassword(),
        "sendCode": (context) => const sendCode(),
        "newPassword": (context) => newPassword(),
        "HomePage": (context) => const HomePage(),
        "ProfilePage": (context) => const ProfilePage(),
        "SettingPage": (context) => const SettingPage(),
        "EditeProfile": (context) => const EditeProfile(),
        "bacsics_categories": (context) => const bacsics_categories(),
        "numbers_page": (context) => numbers_page(),
        "alphabet_page": (context) => alphabet_page(),
        "words_categories": (context) => const words_categories(),
        "animals_page": (context) => animals_page(),
        "vegetables_page": (context) => vegetables_page(),
        "levels_page": (context) => const levels_page(),
        'levelOne': (context) => LevelOne(),
        'levelTwo': (context) => LevelTwo(),

      },
    );
  }
}
