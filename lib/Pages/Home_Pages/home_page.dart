import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Home_Pages/activities_pages/levels_page.dart';
import 'package:kiddie/Pages/Home_Pages/words_pages/categoriesWords_page.dart';
import 'package:kiddie/helper/background_image.dart';
import '../../../components/item.dart';
import '../../models/Animation/WaveCurves.dart';
import '../../models/categories_card.dart';
import 'Basics_Pages/categoriesBasics_page.dart';

// ignore: camel_case_types
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

// ignore: camel_case_types
class _HomePageState extends State<HomePage> {
  final List<Item> homeCategories = [];

  @override
  void initState() {
    super.initState();
    _initializeCategories();
  }

  void _initializeCategories() {
    homeCategories.addAll([
      Item(
        circleBottom: -100,
        circleLeft: 0,
        circleTop: 0,
        circleRight: -320,
        textLeft: 0,
        textRight: 170,
        imageLeft: 200,
        imageRight: 0,
        enName: "Basics",
        description: "Alphabet, Numbers, Pronouns, etc",
        bgColor: const Color(0xffFFF6F0),
        circleColor: const Color(0xffFFE9DB),
        image: 'assets/images/Home/Alphabet .png',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const bacsics_categories()),
          );
        },
      ),
      Item(
        circleBottom: -100,
        circleLeft: -320,
        circleTop: 0,
        circleRight: 0,
        textLeft: 160,
        textRight: 0,
        imageLeft: 0,
        imageRight: 200,
        enName: "Words",
        description: "Animals, Vegetables, Birds, Vehicles, etc",
        bgColor: const Color.fromARGB(255, 229, 244, 255),
        circleColor: const Color(0xffD3EBFB),
        image: 'assets/images/Home/word.png',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const words_categories()),
          );
        },
      ),
      Item(
        circleBottom: -100,
        circleLeft: 0,
        circleTop: 0,
        circleRight: -320,
        textLeft: 0,
        textRight: 170,
        imageLeft: 200,
        imageRight: 0,
        enName: "Spelling",
        description: "Cow, Table, Fish, Spider, etc",
        bgColor: const Color(0xffF2F8DD),
        circleColor: const Color.fromARGB(255, 206, 228, 175),
        image: 'assets/images/Home/spilling.png',
        onTap: () {},
      ),
      Item(
        circleBottom: -100,
        circleLeft: -320,
        circleTop: 0,
        circleRight: 0,
        textLeft: 160,
        textRight: 0,
        imageLeft: 0,
        imageRight: 200,
        enName: "Activities",
        description: "Spellings, Addition, ......., etc",
        bgColor: const Color.fromARGB(255, 252, 230, 227),
        circleColor: const Color(0xffFECAC3),
        image: 'assets/images/Home/qiuz.png',
        onTap: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const levels_page()),
          );
        },
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
            MyAnimatedWaveCurves(
              child: Image.asset('assets/images/Home/welcome.png'),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                itemCount: homeCategories.length,
                itemBuilder: (context, index) {
                  return CategoriesCard(
                    item: homeCategories[index],
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
