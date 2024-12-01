// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Home_Pages/words_pages/animals_page.dart';
import 'package:kiddie/Pages/Home_Pages/words_pages/vegetables_page.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/models/categories_card.dart';
import '../../../components/item.dart';

// ignore: camel_case_types
class words_categories extends StatefulWidget {
  const words_categories({super.key});
  static String id = 'words_categories';

  @override
  State<words_categories> createState() => _words_categoriesState();
}

// ignore: camel_case_types
class _words_categoriesState extends State<words_categories> {
  final List<Item> wordsCategories = [];

  @override
  void initState() {
    super.initState();
    _initializeCategories();
  }

  void _initializeCategories() {
    wordsCategories.addAll([
      Item(
        circleBottom: -100,
        circleLeft: -320,
        circleTop: 0,
        circleRight: 0,
        textLeft: 170,
        textRight: 0,
        imageLeft: 0,
        imageRight: 200,
        description: "Cat, Dog, giraffe, ......., etc",
        enName: "Animals",
        bgColor: const Color.fromARGB(255, 240, 254, 247),
        circleColor: const Color.fromARGB(255, 202, 255, 228),
        image: 'assets/images/categories/words/animals/animals.png',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => animals_page()),
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
        description: "Raptors, Waterfowl, ......, etc",
        enName: "Birds",
        bgColor: const Color.fromARGB(255, 233, 251, 255),
        circleColor: const Color.fromARGB(255, 207, 246, 255),
        image: 'assets/images/categories/words/birds/birds.png',
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
        description: "  Carrots, Potatoes, ....., etc",
        enName: "Vegetables",
        bgColor:  const Color.fromARGB(255, 253, 250, 227),
        circleColor: const Color.fromARGB(255, 252, 244, 178),
        image: 'assets/images/categories/words/vegetables/vegetables.png',
        onTap: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => vegetables_page()),
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
        enName: "Fruits",
        description: "Orange, Strawberry, ......., etc ",
        bgColor: const Color.fromARGB(255, 255, 243, 227),
        circleColor: const Color.fromARGB(255, 255, 228, 193),
        image: 'assets/images/categories/words/fruits/fruits.png',
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
                    fontSize: 0.2, color: Colors.black, text: "Words"),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                itemCount: wordsCategories.length,
                itemBuilder: (context, index) {
                  return CategoriesCard(
                    item: wordsCategories[index],
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
