// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Registration/SignIn_page.dart';
import 'package:kiddie/models/Button/circle_button.dart';
import 'package:kiddie/models/curve_container.dart';
import '../../../helper/background_image.dart';
import '../../../models/TextFaild/customTextFaild.dart';

// ignore: camel_case_types
class newPassword extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  newPassword({super.key});
  static String id = 'newPassword';

  @override
  State<newPassword> createState() => _newPasswordState();
}

// ignore: camel_case_types
class _newPasswordState extends State<newPassword> {
  bool passenable = true;
  TextEditingController password = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController confirm_password = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.022,
                  right: MediaQuery.of(context).size.width * 0.022,
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Image.asset(
                  'assets/images/Registration/newPassword.png',
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: CurveContainer(
                color: const Color.fromARGB(209, 254, 226, 192),
                child: Expanded(
                  child: Column(
                    children: [
                         SizedBox(
                        height: MediaQuery.of(context).size.height * 0.14,
                      ),
                      Column(
                        children: [
                          Text(
                            'Create New Password',
                            style: TextStyle(
                              fontFamily: 'Playfair Display',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width * 0.08,
                            ),
                          ),
                                             
                                            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                            Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: Text(
                        'Enter your new password. if you forgot it. then you have to do forgot password',
                        style: TextStyle(
                        fontFamily: 'Playfair Display',
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                            Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: customTextFaild(
                        textEditingController: password,
                        enable: passenable,
                        hintText: "Enter New Password",
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
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                            Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: customTextFaild(
                        textEditingController: confirm_password,
                        enable: passenable,
                        hintText: "Confirm password",
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
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                            CircleButton(
                      child: const Icon(
                        Icons.done_outline_outlined,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                       Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      );
                      },
                                        
                      // Perform your actions here
                                            ),
                       ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
