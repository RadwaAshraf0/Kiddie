// ignore: file_names
import 'package:flutter/material.dart';

class CurveContainer extends StatelessWidget {
  const CurveContainer({super.key, this.color, this.child});
  final Color? color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: color!,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 6,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(300),
            topRight: Radius.circular(300),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: child!,
      ),
    );
  }
}
