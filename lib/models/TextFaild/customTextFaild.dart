// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class customTextFaild extends StatelessWidget {
  // ignore: non_constant_identifier_names
  customTextFaild(
      {super.key,
      this.hintText,
      this.iconButton,
      this.enable,
      this.textEditingController});

// ignore: non_constant_identifier_names
  String? hintText;
  Widget? iconButton;
  bool? enable;
  TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: TextField(
        obscureText: enable!,
        cursorColor: const Color(0xff151515),
        controller: textEditingController!,
        decoration: InputDecoration(
          hintText: hintText,
          suffix: iconButton!,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelStyle: const TextStyle(
            color: Color(0xff151515),
          ),
        ),
      ),
    );
  }
}
