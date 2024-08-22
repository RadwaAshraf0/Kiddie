import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleButton extends StatelessWidget {
  CircleButton({
    super.key, 
    
    this.onPressed, required this.child});

  VoidCallback? onPressed;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white70, 
            borderRadius: BorderRadius.circular(60),),
        child: IconButton(
            onPressed: onPressed!, 
            icon: child, 
            iconSize: 50));
  }
}
