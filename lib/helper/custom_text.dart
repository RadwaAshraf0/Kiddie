import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.fontSize,
      required this.color,
      required this.text});

  final double fontSize;
  final Color color;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Playfair Display',
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.width * fontSize,
        color: color,
      ),
    );
  }
}
