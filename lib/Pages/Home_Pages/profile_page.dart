import 'package:flutter/material.dart';
import 'package:kiddie/models/widget/BackgroundImage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

bool selected = true;
bool showDropdownContainer = false;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BackgroundImage(
        image: "assets/images/firstPages/paper.jpg",
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(186, 0, 0, 0),
                              shape: BoxShape.circle),
                        ),
                        Container(
                          height: 120.0,
                          width: 120.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/profile/profile.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
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
                          left: 270,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromARGB(199, 250, 207, 154),
                            ),
                            child: const Icon(
                              LineAwesomeIcons.edit,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
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
                  SizedBox(height: 80,),
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * 0.04),
                 child: Container(
                      padding: EdgeInsets.all(
                         MediaQuery.of(context).size.width * 0.07
                         ),
                      color: const Color.fromARGB(201, 1, 1, 1),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Center(
                                child: Text(
                                    'Your progress',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: "Playfair Display",
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.07,
                                    ),
                                  ),
                              ),
                              Text(
                                "Learning a new language can be fun and engaging for young learners, especially when it's done through interactive apps. Designed with colorful graphics and engaging activities, these apps make learning English a playful adventure. Children can explore new words, practice pronunciation, and even sing along to catchy tunes. With features like gamification and progress tracking, these apps motivate kids to keep learning and improve their language skills. Parents can rest assured that their children are learning in a safe and stimulating environment while having fun.",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.028,
                                    color: Colors.white), // Adjust font size
                              ),
                            ],
                          ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                                    'assets/images/profile/progress.png',
                                                    height: MediaQuery.of(context).size.height * 0.18,
                                                  ),
                            ),
                        ],
                      ),
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
