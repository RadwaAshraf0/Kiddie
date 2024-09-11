import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Profile_Pages/profile_page.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/new_password_page.dart';
import 'package:kiddie/models/customTextFaild.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../models/Button/circle_button.dart';
import '../../models/Button/custom_button.dart';
import '../../helper/background_image.dart';

// ignore: must_be_immutable, camel_case_types
class Edite_profile extends StatelessWidget {
  Edite_profile({super.key});
  static String id = 'EditeProfile';
  String userText = 'Hamza Salem';
  String emailText = 'hamza_salem@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BackgroundImage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.33,
                            width: MediaQuery.of(context).size.width * 0.33,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(186, 0, 0, 0),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width * 0.3,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/profile/profile.jpg'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.09,
                              height: MediaQuery.of(context).size.width * 0.09,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color.fromARGB(199, 250, 207, 154),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  LineAwesomeIcons.camera_retro_solid,
                                  color: Colors.black,
                                  size:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              customTextFaild(
                hintText: 'User Name',
                textEditingController: TextEditingController(text: userText),
                enable: false,
                iconButton: const Icon(LineAwesomeIcons.user),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              customTextFaild(
                hintText: 'Email',
                textEditingController: TextEditingController(text: emailText),
                enable: false,
                iconButton: const Icon(Icons.email_outlined),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.55,
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => newPassword()),
                    );
                  },
                  child: const Text(
                    '  Change Password?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Playfair Display',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              customButton(
                height: MediaQuery.of(context).size.height * 0.0001,
                width: MediaQuery.of(context).size.width * 0.0016,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                text: "Update",
                color: const Color.fromARGB(201, 1, 1, 1),
                tcolor: Colors.white,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.15,
                ),
                child: const Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        height: 0.0,
                        thickness: 0.7,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      '   Sign In With   ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Playfair Display',
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 0.0,
                        thickness: 0.7,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleButton(
                    onPressed: () {},
                    child: Image.asset('assets/images/Registration/google.png'),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  CircleButton(
                    onPressed: () {},
                    child: Image.asset('assets/images/Registration/apple.png'),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  CircleButton(
                    onPressed: () {},
                    child:
                        Image.asset('assets/images/Registration/facebook.png'),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
