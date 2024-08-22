import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Registration/SignIn.dart';
import 'package:kiddie/models/widget/BackgroundImage.dart';
import 'package:kiddie/models/Button/CircleButton.dart';
import 'package:kiddie/models/Button/customButton.dart';
import 'package:kiddie/models/CustomContainer/curve_container.dart';
import 'package:kiddie/models/CustomTextFaild/customTextFaild.dart';

import '../../models/widget/CustomNavBarModel.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  static String id = 'SignUp';
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool passenable = true;
  TextEditingController email = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController UserName = TextEditingController();
  TextEditingController password = TextEditingController();
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
        image: "assets/images/firstPages/paper.jpg",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.072 ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Playfair Display',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.027,
            ),
            Expanded(
              flex: 3,
              child: CurveContainer(
                color: const Color.fromARGB(255, 251, 165, 153),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                      customTextFaild(
                      enable: false ,
                      textEditingController: UserName,
                      hintText: 'UserName',
                      iconButton: const Icon(Icons.person),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    customTextFaild(
                      enable: false,
                      textEditingController: email,
                      hintText: 'Email Address',
                      iconButton: const Icon(Icons.email),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.001,
                    ),
                    customTextFaild(
                      enable: passenable,
                      hintText: "Password",
                      textEditingController: password,
                      iconButton: IconButton(
                        onPressed: () {
                          //add Icon button at end of TextField
                          setState(() {
                            //refresh UI
                            if (passenable) {
                              //if passenable == true, make it false
                              passenable = false;
                            } else {
                              passenable =
                                  true; //if passenable == false, make it true
                            }
                          });
                        },
                        icon: Icon(passenable == true
                            ? Icons.remove_red_eye
                            : Icons.password),
                      ),
                    ),
                    
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.035),
                      child: customButton(
                        height: MediaQuery.of(context).size.height * 0.0001,
                        width: MediaQuery.of(context).size.width * 0.0017,
                        onPressed: () {Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(builder: (context) => const CustomNavBar()),
                      );},
                        text: "Sign Up",
                        color: Colors.white70,
                        tcolor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 105, 102, 102),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Playfair Display',
                            ),
                          ),
                          GestureDetector(
                            onTap: () { Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignIn()),
                                  );},
                            child: const Text(
                              '  Sign in?',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Playfair Display',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.05,
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
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1),
                        CircleButton(
                          onPressed: () {},
                          child: Image.asset('assets/images/Registration/apple.png'),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1),
                        CircleButton(
                          child: Image.asset('assets/images/Registration/facebook.png'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}