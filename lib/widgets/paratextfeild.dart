import 'package:flutter/material.dart';
import 'package:lobopunk/core/color.dart';

class ParaTextField extends StatelessWidget {
  const ParaTextField({
    Key? key,
    required this.controller,
    required this.hinttext,
    this.keyboard = TextInputType.text,
    this.maxlen = 100,
    this.maxline = 5,
  }) : super(key: key);

  final TextEditingController controller;
  final String hinttext;
  final int maxlen;
  final int maxline;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboard,
      maxLength: maxlen,
      maxLines: maxline,
      decoration: InputDecoration(
        hintMaxLines: maxline,
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        contentPadding: const EdgeInsets.all(20.0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(width: 1, color: appColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(width: 1, color: appColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(width: 1, color: appColor),
        ),
      ),
    );
  }
}
