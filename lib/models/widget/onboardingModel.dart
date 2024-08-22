// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Registration/SignIn.dart';
import 'package:kiddie/models/widget/BackgroundImage.dart';
import 'package:kiddie/models/CustomContainer/curve_container.dart';

class OnboardingModel extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const OnboardingModel({
    Key? key,
    this.image,
    this.text1,
    this.color,
    this.color2,
    this.color3,
    this.color4,
    this.onpressed,
  });

  final String? image;
  final String? text1;
  final Color? color;
  final Color? color2;
  final Color? color3;
  final Color? color4;

  final Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        image: "assets/images/firstPages/paper.jpg",
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.10),
        child:Column(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  image!,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              Expanded(
                flex: 1,
                child: CurveContainer(
                  color: color!,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: Center(
                          child: Text(
                            text1!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "Playfair Display",
                              fontSize:
                                  MediaQuery.of(context).size.width *
                                      0.09,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height * 0.074,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignIn()),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                            .size
                                            .width *
                                        0.05),
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .width *
                                        0.04,
                                    color: const Color(0xff000000),
                                    fontFamily: "Playfair Display",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.2,
                            ),
                            Icon(
                              Icons.circle,
                              color: color2!,
                              size: MediaQuery.of(context).size.width *
                                  0.03,
                            ),
                            Icon(
                              Icons.circle,
                              color: color3!,
                              size: MediaQuery.of(context).size.width *
                                  0.03,
                            ),
                            Icon(
                              Icons.circle,
                              color: color4!,
                              size: MediaQuery.of(context).size.width *
                                  0.03,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.18,
                            ),
                            IconButton(
                              onPressed: onpressed!,
                              icon: Icon(Icons.arrow_forward,
                                  color:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  size:
                                      MediaQuery.of(context).size.width *
                                          0.07),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
