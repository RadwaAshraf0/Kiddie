import 'package:flutter/material.dart';
import 'package:kiddie/components/item.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/models/itemText_card.dart';

// ignore: camel_case_types
class numbers_page extends StatelessWidget {
  numbers_page({super.key});
  static String id = 'numbers_page';
  final List<Item> numbers = [
    const Item(
        sound: 'sounds/numbers/1.mp3',
        bgColor: Color.fromARGB(255, 253, 214, 248),
        enName: 'One',
        image: 'assets/images/categories/Basics/numbers/1.png'),
        const Item(
        sound: 'sounds/numbers/2.mp3',
        bgColor: Color.fromARGB(255, 255, 238, 219),
        enName: 'Two',
        image: 'assets/images/categories/Basics/numbers/2.png'),
    const Item(
        sound: 'sounds/numbers/3.mp3',
        bgColor: Color.fromARGB(255, 243, 240, 254),
        enName: 'Three',
        image: 'assets/images/categories/Basics/numbers/3.png'),
    const Item(
        sound: 'sounds/numbers/4.mp3',
        bgColor: Color.fromARGB(255, 252, 215, 215),
        enName: 'Four',
        image: 'assets/images/categories/Basics/numbers/4.png'),
    const Item(
        sound: 'sounds/numbers/5.mp3',
        bgColor: Color.fromARGB(255, 242, 255, 212),
        enName: 'Five',
        image: 'assets/images/categories/Basics/numbers/5.png'),
        const Item(
        sound: 'sounds/numbers/6.mp3',
        bgColor: Color.fromARGB(255, 209, 214, 255),
        enName: 'Six',
        image: 'assets/images/categories/Basics/numbers/6.png'),
    const Item(
        sound: 'sounds/numbers/7.mp3',
        bgColor: Color.fromARGB(255, 243, 240, 240),
        enName: 'Seven',
        image: 'assets/images/categories/Basics/numbers/7.png'),
    const Item(
        sound: 'sounds/numbers/8.mp3',
        bgColor: Color.fromARGB(255, 209, 251, 197),
        enName: 'Eight',
        image: 'assets/images/categories/Basics/numbers/8.png'),
        const Item(
        sound: 'sounds/numbers/9.mp3',
        bgColor: Color.fromARGB(255, 249, 252, 170),
        enName: 'Nine',
        image: 'assets/images/categories/Basics/numbers/9.png'),
    const Item(
        sound: 'sounds/numbers/10.mp3',
        bgColor: Color.fromARGB(255, 181, 251, 255),
        enName: 'Ten',
        image: 'assets/images/categories/Basics/numbers/10.png'),
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
                   CustomText(fontSize: 0.2, color: Colors.black, text: 'Numbers'),
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
                  itemCount: numbers.length, // Total number of items
                  itemBuilder: (context, index) {
                    return ItemtextCard(
                      size: 0.06,
                      item: numbers[index],
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
