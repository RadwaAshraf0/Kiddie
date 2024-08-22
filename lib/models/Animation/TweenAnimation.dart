// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TweenAnimation extends StatelessWidget {

   TweenAnimation({
    super.key,
    this.child,
  });

  Widget? child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TweenAnimationBuilder(
        // ignore: sort_child_properties_last
        child: child!,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.bounceOut,
        tween: Tween(begin: 1.0, end: 0.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(value * 60, 0.0),
            child: child,
          );
        },
      ),
    );
  }
}
