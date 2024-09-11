import 'package:flutter/material.dart';

import '../components/item.dart';

// ignore: camel_case_types
class itemCard extends StatelessWidget {
  const itemCard({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        item.playSound();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.6,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.01),
        decoration: BoxDecoration(
          color: item.bgColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0002),
                child: Image.asset(
                  item.image!,
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
