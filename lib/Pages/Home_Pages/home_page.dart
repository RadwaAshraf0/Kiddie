import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiddie/models/Animation/WaveCurves.dart';
import 'package:kiddie/models/widget/BackgroundImage.dart';
import '../../models/CustomContainer/FeatureCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BackgroundImage(
        image: "assets/images/firstPages/paper.jpg",
        child: Column(
          children: [
             MyAnimatedWaveCurves(child: Image.asset('assets/images/Home/welcome.png'),),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child:  Column(
                    children: [
                      const FeatureCard(
                        bottom: -100,
                        left: 0,
                        top: 0,
                        right: -320,
                        text_left: 0,
                        text_right: 170,
                        image_left: 200,
                        image_right: 0,
                        title: "Basics",
                        description: "Alphabet, Numbers, Basic grammar, etc",
                        BgColor: Color(0xffFFF6F0),
                        circleColor: Color(0xffFFE9DB),
                        image: 'assets/images/Home/Alphabet .png',
                      ),

                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      const FeatureCard(
                        bottom: -100,
                        left: -320,
                        top: 0,
                        right: 0,
                        image: 'assets/images/Home/word.png',
                        text_left: 160,
                        text_right: 0,
                        image_left: 0,
                        image_right: 200,
                        title: "Words",
                        description:
                            "Animals, Vegetables, Birds, Vehicles, etc",
                        BgColor: Color.fromARGB(255, 229, 244, 255),
                        circleColor: Color(0xffD3EBFB),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      const FeatureCard(
                        image: 'assets/images/Home/spilling.png',
                        bottom: -100,
                        left: 0,
                        top: 0,
                        right: -320,
                        text_left: 0,
                        text_right: 170,
                        image_left: 200,
                        image_right: 0,
                        title: "Spelling",
                        description: "Cow, Table, Fish, Spider, etc",
                        BgColor: Color(0xffF2F8DD),
                        circleColor: Color.fromARGB(255, 206, 228, 175),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),

                        const FeatureCard(
 bottom: -100,
                        left: -320,
                        top: 0,
                        right: 0,
                        text_left: 160,
                        text_right: 0,
                        image_left: 0,
                        image_right: 200,
                        image: 'assets/images/Home/qiuz.png',
                        title: "Activities",
                        description: "Spellings, Addition, Multiplication, etc",
                        BgColor: Color.fromARGB(255, 252, 230, 227),
                        circleColor: Color(0xffFECAC3),
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
