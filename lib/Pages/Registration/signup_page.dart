import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Registration/SignIn_page.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/models/Button/custom_button.dart';
import 'package:kiddie/models/TextFaild/validiationTextFaild.dart';
import 'package:kiddie/models/curve_container.dart';
import 'package:kiddie/models/signIn_with.dart';

import '../../components/toast.dart';
import '../../components/user_auth/firebaseAuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/CustomNavBarModel.dart';
final CollectionReference collRef = FirebaseFirestore.instance.collection("Users");

class Signup extends StatefulWidget {
  const Signup({super.key});
  static String id = 'SignUp';
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool passenable = true;
  bool isSigningUp = false;
  final FirebaseeAuthService _auth = FirebaseeAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
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
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.072),
                child: CustomText(
                  color: Colors.black,
                  text: "Sign Up",
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
                    TextFormFaild(
                      enable: false,
                      textEditingController: _usernameController,
                      hintText: 'UserName',
                      iconButton: const Icon(Icons.person),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormFaild(
                      enable: false,
                      textEditingController: _emailController,
                      hintText: 'Email Address',
                      iconButton: const Icon(Icons.email),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.001,
                    ),
                    TextFormFaild(
                      enable: passenable,
                      hintText: "Password",
                      textEditingController: _passwordController,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.035),
                      child: CustomButton(
                        height: MediaQuery.of(context).size.height * 0.0001,
                        width: MediaQuery.of(context).size.width * 0.0017,
                        onPressed: _signUp,
                        color: Colors.white70,
                        text: isSigningUp
                            ? const CircularProgressIndicator(
                                color: Colors.black)
                            : Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontFamily: 'Playfair Display',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.09,
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
                            text: 'Already have an account? ',
                            color: const Color.fromARGB(255, 105, 102, 102),
                            fontSize:
                                MediaQuery.of(context).size.width * 0.000085,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn()),
                                  (route) => false);
                            },
                            child: CustomText(
                              text: ' Sign in',
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

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    User? user =
        await FirebaseeAuthService().signUpWithEmailAndPassword(email, password, username,);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      String userId = user.uid; // Get the Firebase Authentication UID for the user

      showToast(message: "User successfully");

      // Initialize progress document in the 'UserProgress' collection for this user
      

      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CustomNavBar()),
      );
  
  } else {
      showToast(message: "Some error happend");
    }
  }
}
