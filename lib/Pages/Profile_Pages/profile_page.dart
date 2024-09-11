import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Profile_Pages/edite-profile.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = 'ProfilePage';
  final double initialPercentage = 40.0;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late double percentage;

  @override
  void initState() {
    super.initState();
    percentage = widget.initialPercentage;
  }

  Color _getColorForPercentage(double percentage) {
    if (percentage <= 20) {
      return Colors.red;
    } else if (percentage <= 50) {
      return Colors.orange;
    } else if (percentage <= 75) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BackgroundImage(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06,
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
                              'assets/images/profile/profile.jpg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Text(
                          'Hamza Salem',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "Playfair Display",
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                        Positioned(
                          top: 1,
                          left: MediaQuery.of(context).size.width * 0.7,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.09,
                            height: MediaQuery.of(context).size.width * 0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromARGB(199, 250, 207, 154),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Edite_profile(),
                                  ),
                                );
                              },
                              icon: Icon(
                                LineAwesomeIcons.edit,
                                color: Colors.black,
                                size: MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.045,
                          ),
                          child: Text(
                            'hamza_salem@gmail.com',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "Playfair Display",
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.038,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius:7,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            color: const Color.fromARGB(201, 1, 1, 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                  Center(
                                    child: Text(
                                      'Your progress',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: "Playfair Display",
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  CircularPercentIndicator(
                                    radius: MediaQuery.of(context).size.width *
                                        0.18,
                                    lineWidth:
                                        MediaQuery.of(context).size.width *
                                            0.038,
                                    animation: true,
                                    animationDuration: 500,
                                    rotateLinearGradient: true,
                                    progressColor:
                                        _getColorForPercentage(percentage),
                                    startAngle: 360.0,
                                    percent: percentage / 100,
                                    center: Text(
                                      "$percentage%",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.grey,
                                    circularStrokeCap: CircularStrokeCap.round,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Center(
                                    child: Text(
                                      "Levels: 2/5",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: -5,
                          right: 0,
                          child: Image.asset(
                            'assets/images/profile/progress.png',
                            height: MediaQuery.of(context).size.height * 0.18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
