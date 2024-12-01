import 'package:flutter/material.dart';
import 'package:kiddie/helper/custom_text.dart';

class Customcontainermodel extends StatelessWidget {
  final IconData icon;
  final double fontSize;
  final String text;
  final Widget child;
  final Color color;
  final double iconSize;
  final Function() onPressed;
  const Customcontainermodel(
      {super.key, required this.icon, required this.text, required this.child, required this.onPressed, required this.fontSize, required this.color, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.03,
          left: MediaQuery.of(context).size.width * 0.03,
          bottom: MediaQuery.of(context).size.height * 0.027,
          ),
          
      child:
      ElevatedButton(
        style: ButtonStyle(
           shadowColor: WidgetStateProperty.all(Colors.grey),
              backgroundColor: WidgetStateProperty.all<Color>(
                color,
              ),
            ),
        onPressed: onPressed, 
        child:   
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04),
              child: Icon(icon,color: Colors.black,size: iconSize,),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            CustomText(
              text: text,
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width *fontSize,
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.04),
              child: child,
            ),
          ],
        ),),
   
    );
  }
}
