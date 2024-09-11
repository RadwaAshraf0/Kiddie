import 'package:flutter/material.dart';
import 'package:kiddie/components/item.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/models/item_card.dart';

// ignore: camel_case_types
class alphabet_page extends StatelessWidget {
  alphabet_page({super.key});
  static String id = 'alphabet_page';
  final List<Item> alphabet = [
    const Item(
        bgColor: Color.fromARGB(255, 253, 214, 248),
        image: 'assets/images/categories/Basics/Alphabet/a.png'),
        const Item(
        bgColor: Color.fromARGB(255, 255, 238, 219),
        image: 'assets/images/categories/Basics/Alphabet/b.png'),
    const Item(
        bgColor: Color.fromARGB(255, 243, 240, 254),
        image: 'assets/images/categories/Basics/Alphabet/c.png'),
    const Item(
        bgColor: Color.fromARGB(255, 252, 215, 215),
        image: 'assets/images/categories/Basics/Alphabet/d.png'),
    const Item(
        bgColor: Color.fromARGB(255, 242, 255, 212),
        image: 'assets/images/categories/Basics/Alphabet/e.png'),
        const Item(
        bgColor: Color.fromARGB(255, 209, 214, 255),
        image: 'assets/images/categories/Basics/Alphabet/f.png'),
    const Item(
        bgColor: Color.fromARGB(255, 243, 240, 240),
        image: 'assets/images/categories/Basics/Alphabet/g.png'),
    const Item(
        bgColor: Color.fromARGB(255, 209, 251, 197),
        image: 'assets/images/categories/Basics/Alphabet/h.png'),
        const Item(
        bgColor: Color.fromARGB(255, 249, 252, 170),
        image: 'assets/images/categories/Basics/Alphabet/i.png'),
    const Item(
        bgColor: Color.fromARGB(255, 181, 251, 255),
        image: 'assets/images/categories/Basics/Alphabet/j.png'),
    const Item(
        bgColor: Color.fromARGB(255, 243, 240, 254),
        image: 'assets/images/categories/Basics/Alphabet/k.png'),
    const Item(
        bgColor: Color.fromARGB(255, 252, 215, 215),
        image: 'assets/images/categories/Basics/Alphabet/l.png'),
    const Item(
        bgColor: Color.fromARGB(255, 242, 255, 212),
        image: 'assets/images/categories/Basics/Alphabet/m.png'),
        const Item(
        bgColor: Color.fromARGB(255, 209, 214, 255),
        image: 'assets/images/categories/Basics/Alphabet/n.png'),
    const Item(
        bgColor: Color.fromARGB(255, 243, 240, 240),
        image: 'assets/images/categories/Basics/Alphabet/o.png'),
    const Item(
        bgColor: Color.fromARGB(255, 209, 251, 197),
        image: 'assets/images/categories/Basics/Alphabet/p.png'),
        const Item(
        bgColor: Color.fromARGB(255, 249, 252, 170),
        image: 'assets/images/categories/Basics/Alphabet/q.png'),
    const Item(
        bgColor: Color.fromARGB(255, 181, 251, 255),
        image: 'assets/images/categories/Basics/Alphabet/r.png'),
    const Item(
        bgColor: Color.fromARGB(255, 243, 240, 254),
        image: 'assets/images/categories/Basics/Alphabet/s.png'),
    const Item(
        bgColor: Color.fromARGB(255, 252, 215, 215),
        image: 'assets/images/categories/Basics/Alphabet/t.png'),
    const Item(
        bgColor: Color.fromARGB(255, 242, 255, 212),
        image: 'assets/images/categories/Basics/Alphabet/u.png'),
        const Item(
        bgColor: Color.fromARGB(255, 209, 214, 255),
        image: 'assets/images/categories/Basics/Alphabet/v.png'),
    const Item(
        bgColor: Color.fromARGB(255, 243, 240, 240),
        image: 'assets/images/categories/Basics/Alphabet/w.png'),
    const Item(
        bgColor: Color.fromARGB(255, 209, 251, 197),
        image: 'assets/images/categories/Basics/Alphabet/x.png'),
        const Item(
        bgColor: Color.fromARGB(255, 249, 252, 170),
        image: 'assets/images/categories/Basics/Alphabet/y.png'),
    const Item(
        bgColor: Color.fromARGB(255, 181, 251, 255),
        image: 'assets/images/categories/Basics/Alphabet/z.png'),
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
                  itemCount: alphabet.length, // Total number of items
                  itemBuilder: (context, index) {
                    return itemCard(
                      item: alphabet[index],
                    );
                  }),
            ),
                 SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
          ],
        ),
      ),
    );
  }
}
