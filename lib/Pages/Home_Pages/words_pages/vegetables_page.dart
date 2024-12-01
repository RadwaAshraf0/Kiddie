import 'package:flutter/material.dart';
import 'package:kiddie/components/item.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/models/itemText_card.dart';

// ignore: camel_case_types
class vegetables_page extends StatelessWidget {
  vegetables_page({super.key});
  static String id = 'vegetables_page';
  final List<Item> vegetables = [
    const Item(
        bgColor: Color.fromARGB(255, 242, 255, 212), 
        enName: 'Potato',
        image: 'assets/images/categories/words/vegetables/Potato.png'),
        const Item(
        bgColor: Color.fromARGB(255, 181, 251, 255),
        enName: 'Carrots',
        image: 'assets/images/categories/words/vegetables/Carrots.png'),
    const Item(
        bgColor: Color.fromARGB(255, 243, 240, 254),
        enName: 'Tomato',
        image: 'assets/images/categories/words/vegetables/Tomato.png'),
    const Item(
        bgColor: Color.fromARGB(255, 252, 215, 215),
        enName: 'Onion',
        image: 'assets/images/categories/words/vegetables/Onion.png'),
    const Item(
        bgColor: Color.fromARGB(255, 253, 214, 248),
        enName: 'Lettle',
        image: 'assets/images/categories/words/vegetables/Lettle.png'),
        const Item(
        bgColor: Color.fromARGB(255, 209, 214, 255),
        enName: 'Brooklyn',
        image: 'assets/images/categories/words/vegetables/Brooklyn.png'),
    const Item(
        bgColor: Color.fromARGB(255, 243, 240, 240),
        enName: 'Lemon',
        image: 'assets/images/categories/words/vegetables/Lemon.png'),
    const Item(
        bgColor: Color.fromARGB(255, 209, 251, 197),
        enName: 'Pepper',
        image: 'assets/images/categories/words/vegetables/Pepper.png'),
        const Item(
        bgColor: Color.fromARGB(255, 249, 252, 170),
        enName: 'Radish',
        image: 'assets/images/categories/words/vegetables/Radish.png'),
    const Item(
        bgColor: Color.fromARGB(255, 255, 238, 219),
        enName: 'Garlic',
        image: 'assets/images/categories/words/vegetables/Garlic.png'),
    const Item(
        bgColor: Color.fromARGB(255, 252, 215, 215),
        enName: 'Eggplant',
        image: 'assets/images/categories/words/vegetables/Eggplant.png'),
       const Item(
        bgColor: Color.fromARGB(255, 243, 240, 254),
        enName: 'Peas',
        image: 'assets/images/categories/words/vegetables/Peas.png'),
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
                   CustomText(fontSize: 0.2, color: Colors.black, text: 'Vegetables'),
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
                  itemCount: vegetables.length, // Total number of items
                  itemBuilder: (context, index) {
                    return ItemtextCard(
                      size: 0.06,
                      item: vegetables[index],
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
