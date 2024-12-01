// ignore: file_names
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.color,
    required this.height,
    required this.width,
  });

  final Widget? text;
  final Color? color;
  final double width;
  final double height;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? Colors.grey, // Provide a default color
        ),
      ),
      onPressed: onPressed ?? () {}, // Provide a default function
      child: SizedBox(
        height: MediaQuery.of(context).size.height * height,
        width: MediaQuery.of(context).size.width * width,
        child: Center(child: text),
      ),
    );
  }
}

