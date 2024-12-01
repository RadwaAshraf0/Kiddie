import 'package:flutter/material.dart';

class VisibilityComponent extends StatelessWidget {
  const VisibilityComponent({super.key,  required this.visible, required this.child});
  final bool visible;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return  Visibility(
                visible: visible,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.height * 0.03,
                      left: MediaQuery.of(context).size.height * 0.03,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    color: const Color.fromARGB(201, 1, 1, 1),
                    child: child,
                    ),
                  ),
              );
              
  }
}