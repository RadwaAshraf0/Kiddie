import 'package:flutter/material.dart';
import 'package:kiddie/components/item.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/models/itemText_card.dart';

// ignore: camel_case_types
class animals_page extends StatelessWidget {
  animals_page({super.key});
  static String id = 'animals_page';
  final List<Item> animals = [
    const Item(
        bgColor: Color.fromARGB(255, 253, 214, 248),
        enName: 'Lion',
        image: 'assets/images/categories/words/animals/Lion.png'),
        const Item(
        bgColor: Color.fromARGB(255, 255, 238, 219),
        enName: 'Tiger',
        image: 'assets/images/categories/words/animals/Tiger.png'),
    const Item(
        bgColor: Color.fromARGB(255, 243, 240, 254),
        enName: 'Fox',
        image: 'assets/images/categories/words/animals/Fox.png'),
    const Item(
        bgColor: Color.fromARGB(255, 252, 215, 215),
        enName: 'Wolf',
        image: 'assets/images/categories/words/animals/Wolf.png'),
    const Item(
        bgColor: Color.fromARGB(255, 242, 255, 212),
        enName: 'Giraffe',
        image: 'assets/images/categories/words/animals/Giraffe.png'),
        const Item(
        bgColor: Color.fromARGB(255, 209, 214, 255),
        enName: 'Zebra',
        image: 'assets/images/categories/words/animals/Zebra.png'),
    const Item(
        bgColor: Color.fromARGB(255, 243, 240, 240),
        enName: 'Rhino',
        image: 'assets/images/categories/words/animals/Rhino.png'),
    const Item(
        bgColor: Color.fromARGB(255, 209, 251, 197),
        enName: 'Hippo',
        image: 'assets/images/categories/words/animals/Hippo.png'),
        const Item(
        bgColor: Color.fromARGB(255, 249, 252, 170),
        enName: 'Snake',
        image: 'assets/images/categories/words/animals/Snake.png'),
    const Item(
        bgColor: Color.fromARGB(255, 181, 251, 255),
        enName: 'Monkey',
        image: 'assets/images/categories/words/animals/Monkey.png'),
    const Item(
        bgColor: Color.fromARGB(255, 252, 215, 215),
        enName: 'Cow',
        image: 'assets/images/categories/words/animals/Cow.png'),
       const Item(
        bgColor: Color.fromARGB(255, 243, 240, 254),
        enName: 'Sheep',
        image: 'assets/images/categories/words/animals/Sheep.png'),
  ];
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
                    top: MediaQuery.of(context).size.height * 0.05),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   CustomText(fontSize: 0.2, color: Colors.black, text: 'Animals'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01 ),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items per row
                  ),
                  itemCount: animals.length, // Total number of items
                  itemBuilder: (context, index) {
                    return ItemtextCard(
                      size: 0.06,
                      item: animals[index],
                    );
                  }),
            ),
                 SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
          ],
        ),
      ),
    );
  }
}
