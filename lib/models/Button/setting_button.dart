import 'package:flutter/material.dart';

class Customcontainermodel extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget child;
  final Function() onPressed;
  const Customcontainermodel(
      {super.key, required this.icon, required this.text, required this.child, required this.onPressed});

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
                const Color.fromARGB(199, 250, 207, 154),
              ),
            ),
        onPressed: onPressed, 
        child:   
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04),
              child: Icon(icon,color: Colors.black,),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: "Playfair Display",
                fontSize: MediaQuery.of(context).size.width * 0.045,
              ),
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
