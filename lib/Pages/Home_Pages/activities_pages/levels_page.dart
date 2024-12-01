import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Home_Pages/activities_pages/level_two.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/models/levels_card.dart';
import '../../../components/item.dart';
import 'level_one.dart';

// ignore: camel_case_types
class levels_page extends StatefulWidget {
  const levels_page({super.key});
  static String id = 'levels_page';

  @override
  State<levels_page> createState() => _levels_pageState();
}

// ignore: camel_case_types
class _levels_pageState extends State<levels_page> {
  final List<Item> levels = [];

  @override
  void initState() {
    super.initState();
    _initializeCategories();
  }

  void _initializeCategories() {
    levels.addAll([
      Item(
        circleBottom: 10,
        circleLeft: 10,
        circleTop: 10,
        circleRight: 10,
        enName: "Level 1",
        bgColor: const Color.fromARGB(255, 250, 188, 184),
        circleColor: const Color.fromARGB(255, 241, 127, 119),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LevelOne()),
          );
        },
      ),
      Item(
        circleBottom: 10,
        circleLeft: 10,
        circleTop: 10,
        circleRight: 10,
        enName: "Level 2",
        bgColor: const Color.fromARGB(255, 250, 227, 193),
        circleColor: const Color.fromARGB(255, 249, 209, 149),
        onTap: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LevelTwo()),
          );
        },
      ),
      Item(
        circleBottom: 10,
        circleLeft: 10,
        circleTop: 10,
        circleRight: 10,
        enName: "Level 3",
        bgColor: const Color.fromARGB(255, 245, 240, 196),
        circleColor: const Color.fromARGB(255, 251, 241, 148),
        onTap: () {},
      ),
      Item(
        circleBottom: 10,
        circleLeft: 10,
        circleTop: 10,
        circleRight: 10,
        enName: "Level 4",
        bgColor: const Color.fromARGB(255, 241, 251, 220),
        circleColor: const Color.fromARGB(255, 219, 245, 158),
        onTap: () {},
      ),
    ]);
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
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06),
                child: const CustomText(
                    fontSize: 0.2, color: Colors.black, text: "Activities"),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return LevelsCard(
                    item: levels[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
