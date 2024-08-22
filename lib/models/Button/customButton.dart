// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class customButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  customButton(
      {super.key,
      this.text,
      this.onPressed,
      this.color,
      this.tcolor,
      required this.height,
      required this.width});

  final String? text;
  final Color? color;
  final Color? tcolor;
  final double width;
  final double height;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          color!,
        ),
      ),
      onPressed: onPressed!,
      child: Container(
        height: MediaQuery.of(context).size.height * height,
        width: MediaQuery.of(context).size.width * width,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: tcolor!,
              fontFamily: 'Playfair Display',
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
