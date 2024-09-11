// ignore: file_names
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, this.image, this.child});
  final String? image;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        // BoxDecoration takes the image
        decoration: const BoxDecoration(
          // Image set to background of the body
          image: DecorationImage(image: AssetImage("assets/images/firstPages/paper.jpg"), fit: BoxFit.cover),
        ),
        child: child!,
      ),
    );
  }
}
