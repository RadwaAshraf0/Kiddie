// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/new_password_page.dart';
import 'package:kiddie/models/Button/CircleButton.dart';
import 'package:kiddie/models/CustomContainer/curve_container.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../../models/widget/BackgroundImage.dart';

// ignore: camel_case_types
class sendCode extends StatelessWidget {
  const sendCode({Key? key}) : super(key: key);
  static String id = 'sendCode';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: Image.asset(
                  'assets/images/Registration/message.png',
                  height: MediaQuery.of(context).size.height * 0.95,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.001),
            Expanded(
              flex: 3,
              child: CurveContainer(
                color: Color.fromARGB(209, 254, 226, 192),
                child: Expanded(
                  child: Column(
                    children: [
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.05),
                        child: Text(
                          'We have sent the OTP verification code to your Email OR Telephone. Check and enter the code below.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontFamily: 'Playfair Display',
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  
                               
                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                              OtpTextField(
                                numberOfFields: 5,
                                cursorColor: Colors.black,
                                focusedBorderColor: Colors.orange,
                                enabledBorderColor: Colors.black,
                                autoFocus: true,
                                borderWidth: 3,
                                showFieldAsBox: true,
                                onCodeChanged: (String code) {},
                                onSubmit: (String verificationCode) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title:  Text("Verification Code", style: TextStyle(
                    fontFamily: 'Playfair Display',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),),
                        content: Text('Code entered is $verificationCode'
                  ),
                      );
                    },
                  );
                                },
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Center(
                                child: Text(
                  'Didn\'t receive the code?',
                  style: TextStyle(
                    fontFamily: 'Playfair Display',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                  Text(
                    'Resend code in  ',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                  Countdown(
                    seconds: 30,
                    build: (BuildContext context, double time) =>
                        Text(time.toString()),
                    interval: const Duration(milliseconds: 500),
                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                              CircleButton(
                        onPressed: (){ Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => newPassword()),
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
