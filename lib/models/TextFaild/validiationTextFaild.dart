// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFaild extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const TextFormFaild(
      {super.key,
      this.hintText,
      this.iconButton,
      this.enable,
      this.textEditingController, 
      this.fieldKey, 
      this.helperText, 
      this.onSaved, 
      this.validator, 
      this.onFieldSubmitted, 
      this.inputType});

// ignore: non_constant_identifier_names
  final String? hintText;
  final Widget? iconButton;
  final bool? enable;
  final TextEditingController? textEditingController;
  final Key? fieldKey;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  @override
  State<TextFormFaild> createState() => _TextFormFaildState();
}

class _TextFormFaildState extends State<TextFormFaild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: TextFormField(
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        obscureText: widget.enable!,
        cursorColor: const Color(0xff151515),
        controller: widget.textEditingController!,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffix: widget.iconButton!,
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
