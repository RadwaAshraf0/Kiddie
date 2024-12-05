import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kiddie/components/user_auth/firebaseAuthService.dart';
import 'package:kiddie/components/visibility.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/models/Animation/WaveCurves.dart';
import 'package:kiddie/models/Button/setting_button.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:url_launcher/url_launcher.dart' as learner;

// ignore: must_be_immutable
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  static String id = 'SettingPage';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

bool selected = true;
bool showDropdownContact = false;
bool showDropdownContainer = false;

class _SettingPageState extends State<SettingPage> {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BackgroundImage(
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
                    CustomText(
                      fontSize: MediaQuery.of(context).size.width * 0.0004,
                      color: Colors.black,
                      text: 'Settings',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
                child: Customcontainermodel(
                  color: const Color.fromARGB(199, 250, 207, 154),
                  fontSize: 0.0001,
                  onPressed: () {},
                  iconSize: MediaQuery.of(context).size.width * 0.07,
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
                iconSize: MediaQuery.of(context).size.width * 0.07,
                color: const Color.fromARGB(199, 250, 207, 154),
                fontSize: 0.0001,
                icon: Icons.help_outline,
                text: 'Help',
                onPressed: () {
                  setState(() {
                    showDropdownContainer = !showDropdownContainer;
                  });
                },
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      showDropdownContainer = !showDropdownContainer;
                    });
                  },
                  icon: Icon(
                    showDropdownContainer == false
                        ? Icons.arrow_right_outlined
                        : Icons.arrow_drop_down_outlined,
                    color: Colors.black,
                  ),
                  iconSize: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
              VisibilityComponent(
                visible: showDropdownContainer,
                child: CustomText(
                  fontSize: MediaQuery.of(context).size.width * 0.00009,
                  color: Colors.white,
                  text:
                      "Learning a new language can be fun and engaging for young learners, especially when it's done through interactive apps. Designed with colorful graphics and engaging activities, these apps make learning English a playful adventure. Children can explore new words, practice pronunciation, and even sing along to catchy tunes. With features like gamification and progress tracking, these apps motivate kids to keep learning and improve their language skills. Parents can rest assured that their children are learning in a safe and stimulating environment while having fun.",
                ),
              ),
              Customcontainermodel(
                iconSize: MediaQuery.of(context).size.width * 0.07,
                color: const Color.fromARGB(199, 250, 207, 154),
                fontSize: 0.0001,
                icon: Icons.contact_mail_outlined,
                text: 'Contact us',
                onPressed: () {
                  setState(() {
                    showDropdownContact = !showDropdownContact;
                  });
                },
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      showDropdownContact = !showDropdownContact;
                    });
                  },
                  icon: Icon(
                    showDropdownContact == false
                        ? Icons.arrow_right_outlined
                        : Icons.arrow_drop_down_outlined,
                    color: Colors.black,
                  ),
                  iconSize: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
              VisibilityComponent(
                visible: showDropdownContact,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Customcontainermodel(
                      iconSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.white70,
                      fontSize: 0.00007,
                      icon: Icons.email,
                      text: 'Email',
                      onPressed: () async {
                        Uri uri = Uri.parse(
                            'mailto:radwaashraf516@gmail.com subject = Kiddie Url Lancher&body = Hi');
                        !await learner.launchUrl(uri);
                      },
                      child: IconButton(
                        onPressed: () async {
                          Uri uri = Uri.parse('mailto:kiddie@gmail.com');
                          !await learner.launchUrl(uri);
                        },
                        icon: const Icon(
                          Icons.arrow_right_outlined,
                          color: Colors.black,
                        ),
                        iconSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                    Customcontainermodel(
                      iconSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.white70,
                      fontSize: 0.00007,
                      icon: Icons.sms,
                      text: 'SMS',
                      onPressed: () {
                        learner.launchUrl(
                          Uri.parse(
                              'sms:012645692830${Platform.isAndroid ? '?' : '&'}'),
                        );
                      },
                      child: IconButton(
                        onPressed: () {
                          learner.launchUrl(
                            Uri.parse(
                                'sms:012645692830${Platform.isAndroid ? '?' : '&'}'),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_right_outlined,
                          color: Colors.black,
                        ),
                        iconSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                    Customcontainermodel(
                      iconSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.white70,
                      fontSize: 0.00007,
                      icon: Icons.phone,
                      text: 'Phone',
                      onPressed: () async {
                        Uri uri = Uri.parse('tel: +20-126-456-928-30');
                        !await learner.launchUrl(uri);
                      },
                      child: IconButton(
                        onPressed: () async {
                          Uri uri = Uri.parse('tel: +20-126-456-928-30');
                          !await learner.launchUrl(uri);
                        },
                        icon: const Icon(
                          Icons.arrow_right_outlined,
                          color: Colors.black,
                        ),
                        iconSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                  ],
                ),
              ),
              Customcontainermodel(
                iconSize: MediaQuery.of(context).size.width * 0.07,
                color: const Color.fromARGB(199, 250, 207, 154),
                fontSize: 0.0001,
                icon: Icons.logout_outlined,
                text: 'LogOut',
                onPressed: () => FirebaseeAuthService().logOut(context),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_right_outlined,
                    color: Colors.black,
                  ),
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
