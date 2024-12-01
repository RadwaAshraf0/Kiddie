// ignore: unnecessary_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Registration/signup_page.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/forgetPassword_page.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/models/curve_container.dart';
import 'package:kiddie/models/Button/custom_button.dart';
import 'package:kiddie/models/CustomNavBarModel.dart';
import 'package:kiddie/models/TextFaild/customTextFaild.dart';

import '../../components/toast.dart';
import '../../components/user_auth/firebaseAuthService.dart';
import '../../models/signIn_with.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static String id = 'SignIn';
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool passenable = true;
  bool _isSigning = false;
  final FirebaseeAuthService _auth = FirebaseeAuthService();
  // ignore: unused_field
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                child: CustomText(
                  color: Colors.black,
                  text: "Sign in",
                  fontSize: MediaQuery.of(context).size.width * 0.00062,
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
                      textEditingController: _emailController,
                      enable: false,
                      hintText: 'Email Address',
                      iconButton: const Icon(Icons.email),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    customTextFaild(
                      textEditingController: _passwordController,
                      enable: passenable,
                      hintText: "Password",
                      iconButton: IconButton(
                        onPressed: () 
                        {
                          setState(() {
                            if (passenable) 
                            {
                              passenable = false;
                            } else {
                              passenable = true;
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
                          child: CustomText(
                            text: 'Forget password?',
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.00008,
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
                      child: CustomButton(
                        color: Colors.white70,
                        height: MediaQuery.of(context).size.height * 0.0001,
                        width: MediaQuery.of(context).size.width * 0.0017,
                        onPressed: _signIn,
                        text: _isSigning
                            ? const CircularProgressIndicator(
                                color: Colors.black)
                            : Text(
                                "Sign In",
                                style: TextStyle(
                                    fontFamily: 'Playfair Display',
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.1,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Need an account?',
                            color: const Color.fromARGB(255, 105, 102, 102),
                            fontSize:
                                MediaQuery.of(context).size.width * 0.000085,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()),
                                (route) => false,
                              );
                            },
                            child: CustomText(
                              text: '  Sign Up',
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.0001,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    const SigninWith(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const CustomNavBar()),
      );
    } else {
      showToast(message: "some error occured");
    }
  }
}
