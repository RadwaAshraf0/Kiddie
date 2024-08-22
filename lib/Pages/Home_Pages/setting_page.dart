import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Registration/SignIn.dart';
import 'package:kiddie/models/Animation/WaveCurves.dart';
import 'package:kiddie/models/CustomContainer/custom_container_model.dart';
import 'package:kiddie/models/widget/BackgroundImage.dart';

// ignore: must_be_immutable
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  static String id = 'SettingPage';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

bool selected = true;
bool showDropdownContainer = false;

class _SettingPageState extends State<SettingPage> {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BackgroundImage(
        image: "assets/images/firstPages/paper.jpg",
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAnimatedWaveCurves(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/settings/setting.png',
                      height: MediaQuery.of(context).size.height * 0.17,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Playfair Display",
                        fontSize: MediaQuery.of(context).size.width * 0.14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
                child: Customcontainermodel(
                  icon: Icons.notifications_none_outlined,
                  text: 'Notifications',
                  child: Switch(
                    value: selected,
                    activeColor: const Color.fromARGB(217, 0, 0, 0),
                    onChanged: (bool value) {
                      setState(() {
                        selected = value;
                      });
                    },
                  ),
                ),
              ),
              Customcontainermodel(
                icon: Icons.help_outline,
                text: 'Help',
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      showDropdownContainer = !showDropdownContainer;
                    });
                  },
                  icon: Icon(showDropdownContainer == false
                      ? Icons.arrow_right_outlined
                      : Icons.arrow_drop_down_outlined),
                  iconSize: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
              Visibility(
                visible: showDropdownContainer,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.height * 0.03,
                      left: MediaQuery.of(context).size.height * 0.03,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    color: const Color.fromARGB(201, 1, 1, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Learning a new language can be fun and engaging for young learners, especially when it's done through interactive apps. Designed with colorful graphics and engaging activities, these apps make learning English a playful adventure. Children can explore new words, practice pronunciation, and even sing along to catchy tunes. With features like gamification and progress tracking, these apps motivate kids to keep learning and improve their language skills. Parents can rest assured that their children are learning in a safe and stimulating environment while having fun.",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.028,
                              color: Colors.white), // Adjust font size
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Customcontainermodel(
                icon: Icons.feedback_outlined,
                text: 'Feedback',
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_right_outlined),
                  iconSize: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
              Customcontainermodel(
                icon: Icons.contact_mail_outlined,
                text: 'Contact us',
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_right_outlined),
                  iconSize: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
              Customcontainermodel(
                icon: Icons.logout_outlined,
                text: 'LogOut',
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  icon: const Icon(Icons.arrow_right_outlined),
                  iconSize: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
