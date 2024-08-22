// ignore: file_names
import 'package:flutter/cupertino.dart';

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
