// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Registration/signup_page.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/forgetPassword_page.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/models/Button/circle_button.dart';
import 'package:kiddie/models/curve_container.dart';
import 'package:kiddie/models/Button/custom_button.dart';
import 'package:kiddie/models/CustomNavBarModel.dart';
import 'package:kiddie/models/customTextFaild.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static String id = 'SignIn';
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool passenable = true;
  TextEditingController email = TextEditingController();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.001),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.072),
                child: const Text(
                  "Sign in",
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
                      textEditingController: email,
                      enable: false,
                      hintText: 'Email Address',
                      iconButton: const Icon(Icons.email),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    customTextFaild(
                      textEditingController: password,
                      enable: passenable,
                      hintText: "Password",
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
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.height * 0.04),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => forgetPassword()),
                            );
                          },
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Playfair Display',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.035),
                      child: customButton(
                        height: MediaQuery.of(context).size.height * 0.0001,
                        width: MediaQuery.of(context).size.width * 0.0017,
                        onPressed: () { Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(builder: (context) => const CustomNavBar()),
                      );},
                        text: "Sign in",
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
                            'Need an account?',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 105, 102, 102),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Playfair Display',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()),
                              );
                            },
                            child: const Text(
                              '  Sign Up?',
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
                      height: MediaQuery.of(context).size.height * 0.04,
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
                          child: Image.asset(
                              'assets/images/Registration/google.png'),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1),
                        CircleButton(
                          onPressed: () {},
                          child: Image.asset(
                              'assets/images/Registration/apple.png'),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1),
                        CircleButton(
                          onPressed: () {},
                          child: Image.asset(
                              'assets/images/Registration/facebook.png'),
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
