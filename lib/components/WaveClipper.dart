import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class MyWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 0.0); // Start from the top-left corner
    path.lineTo(0.0, size.height - 160); // Line down to the start of the wave

    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        path.quadraticBezierTo(
            size.width / 16 + (i * size.width / 8), // Control point X
            size.height - 120, // Control point Y (higher than the base)
            (i + 1) * size.width / 8, // End point X
            size.height - 160); // End point Y
      } else {
        path.quadraticBezierTo(
            size.width / 16 + (i * size.width / 8), // Control point X
            size.height - 200, // Control point Y (lower than the base)
            (i + 1) * size.width / 8, // End point X
            size.height - 160); // End point Y
      }
    }

    path.lineTo(size.width, size.height - 160); // Line to the bottom-right corner
    path.lineTo(size.width, 0.0); // Line to the top-right corner
    path.close(); // Close the path to create a filled shape

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
