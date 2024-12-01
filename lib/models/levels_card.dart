// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kiddie/helper/custom_text.dart';

import '../components/item.dart';

class LevelsCard extends StatelessWidget {
  const LevelsCard({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
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
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: item.circleBottom,
                left: item.circleLeft,
                top: item.circleTop,
                right: item.circleRight,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.circleColor,
                  ),
                ),
              ),
              Center(
                child: CustomText(
                    fontSize: 0.13, color: Colors.black, text: item.enName!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
