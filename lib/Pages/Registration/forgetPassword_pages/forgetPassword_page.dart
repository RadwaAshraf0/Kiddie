// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/sendCode_page.dart';
import 'package:kiddie/models/Button/circle_button.dart';
import 'package:kiddie/models/curve_container.dart';
import 'package:kiddie/models/TextFaild/customTextFaild.dart';
import '../../../helper/background_image.dart';

// ignore: camel_case_types, must_be_immutable
class forgetPassword extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  forgetPassword({Key? key}) : super(key: key);
  static String id = 'forgetPassword';
  TextEditingController User = new TextEditingController();

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
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.022),
                child: Image.asset(
                  'assets/images/Registration/forget.png',
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Expanded(
              flex: 2,
              child: CurveContainer(
                color: Color.fromARGB(209, 254, 226, 192),
                child: Expanded(
                  child: Column(
                    children: [
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      customTextFaild(
                        textEditingController: User,
                        iconButton: const Icon(Icons.person),
                        enable: false,
                        hintText: "Enter your email OR Your phone number",
                      ),
                       SizedBox(                      height: MediaQuery.of(context).size.height * 0.025,
                  ),
                      const Text(
                        "We will send you a code to set a new password",
                        style: TextStyle(
                          color: Color(0xe7151515),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Playfair Display',
                        ),
                      ),
                   SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),  CircleButton(
                        onPressed: (){ Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => sendCode()),
                          );},
                        child: Icon(Icons.arrow_circle_right , color: Colors.black87,),
                      )  ,           
                   
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
