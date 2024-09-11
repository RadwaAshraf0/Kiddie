import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Home_Pages/Basics_Pages/alphabet_page.dart';
import 'package:kiddie/Pages/Home_Pages/Basics_Pages/numbers_page.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/models/categories_card.dart';
import '../../../components/item.dart';

// ignore: camel_case_types
class bacsics_categories extends StatefulWidget {
  const bacsics_categories({super.key});
  static String id = 'bacsics_categories';

  @override
  State<bacsics_categories> createState() => _bacsics_categoriesState();
}

// ignore: camel_case_types
class _bacsics_categoriesState extends State<bacsics_categories> {
  final List<Item> bacsicsCategories = [];

  @override
  void initState() {
    super.initState();
    _initializeCategories();
  }

  void _initializeCategories() {
    bacsicsCategories.addAll([
      Item(
        circleBottom: -100,
        circleLeft: -320,
        circleTop: 0,
        circleRight: 0,
        textLeft: 170,
        textRight: 0,
        imageLeft: 0,
        imageRight: 200,
        enName: "Alphabet",
        description: "A, B, C, .............., etc",
        bgColor: const Color.fromARGB(255, 243, 240, 254),
        circleColor: const Color.fromARGB(255, 227, 221, 255),
        image: 'assets/images/categories/Basics/Alphabet/Alphabet.png',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => alphabet_page()),
          );
        },
      ),
      Item(
        circleBottom: -100,
        circleLeft: 0,
        circleTop: 0,
        circleRight: -320,
        textLeft: 0,
        textRight: 160,
        imageLeft: 200,
        imageRight: 0,
        enName: "Numbers",
        description: "1, 2, 3, ..............., etc",
        bgColor: const Color.fromARGB(255, 241, 251, 220),
        circleColor: const Color.fromARGB(255, 219, 245, 158),
        image: 'assets/images/categories/Basics/numbers/numbers.png',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => numbers_page()),
          );
        },
      ),
      Item(
        circleBottom: -100,
        circleLeft: -320,
        circleTop: 0,
        circleRight: 0,
        textLeft: 170,
        textRight: 0,
        imageLeft: 0,
        imageRight: 200,
        enName: "Pronouns",
        description: "Personal, possessive, etc",
        bgColor: const Color.fromARGB(255, 253, 235, 248),
        circleColor: const Color.fromARGB(255, 247, 210, 236),
        image: 'assets/images/categories/Basics/Pronouns.png',
        onTap: () {},
      ),
      Item(
        circleBottom: -100,
        circleLeft: 0,
        circleTop: 0,
        circleRight: -320,
        textLeft: 0,
        textRight: 160,
        imageLeft: 200,
        imageRight: 0,
        enName: "Basic grammar",
        description: "Past , present and future tense, etc",
        bgColor: const Color.fromARGB(255, 252, 249, 225),
        circleColor: const Color.fromARGB(255, 245, 233, 144),
        image: 'assets/images/categories/Basics/grammer.png',
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
                    fontSize: 0.2, color: Colors.black, text: "Basics"),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                itemCount: bacsicsCategories.length,
                itemBuilder: (context, index) {
                  return CategoriesCard(
                    item: bacsicsCategories[index],
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
