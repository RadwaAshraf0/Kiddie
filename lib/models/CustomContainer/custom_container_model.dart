import 'package:flutter/material.dart';

class Customcontainermodel extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget child;
  const Customcontainermodel(
      {super.key, required this.icon, required this.text, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.03,
          left: MediaQuery.of(context).size.width * 0.03,
          bottom: MediaQuery.of(context).size.height * 0.027,
          ),
      child: Container(
        decoration: const BoxDecoration(
          color: const Color.fromARGB(199, 250, 207, 154),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04),
              child: Icon(icon),
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
        ),
      ),
    );
  }
}
