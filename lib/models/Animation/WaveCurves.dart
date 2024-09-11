import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/WaveClipper.dart';

// Set this class to home of material app in main.dart
class MyAnimatedWaveCurves extends StatefulWidget {
  final Widget child;
  const MyAnimatedWaveCurves({super.key, required this.child});
  @override
  State<StatefulWidget> createState() {
    return _MyAnimatedWavesCurves();
  }
}

class _MyAnimatedWavesCurves extends State<MyAnimatedWaveCurves>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    _controller.repeat();
    // we set animation duration, and repeat for infinity

    animation = Tween<double>(begin: -400, end: 0).animate(_controller);
    // we have set begin to -600 and end to 0, it will provide the value for
    // left or right position for Positioned() widget to create movement from left to right
    animation.addListener(() {
      setState(() {}); // update UI on every animation value update
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // destroy animation to free memory on last
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The animated wave layers
        Positioned(
          top: 0, // Position at the bottom
          right: animation.value, // Value of right from animation controller
          child: ClipPath(
            clipper: MyWaveClipper(), // Applying our custom clipper
            child: Opacity(
              opacity: 0.5,
              child: Container(
                color: const Color.fromARGB(255, 250, 207, 154),
                width: 900,
                height: 300,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0, // Position at the bottom
          left: animation.value, // Value of left from animation controller
          child: ClipPath(
            clipper: MyWaveClipper(), // Applying our custom clipper
            child: Opacity(
              opacity: 0.5,
              child: Container(
                color: const Color.fromARGB(255, 250, 207, 154),
                width: 900,
                height: 325,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.04,
              vertical: MediaQuery.of(context).size.width * 0.06),
          child: widget.child,
        ),
      ],
    );
  }
}
