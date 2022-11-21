import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCurvedWidget extends StatelessWidget {
  const TextFormFieldCurvedWidget({
    Key? key,
    required this.controller,
    required this.hinttext,
    this.username = false,
    this.keyboard = TextInputType.text,
    this.type = "normal",
  }) : super(key: key);

  final TextEditingController controller;
  final String hinttext;
  final bool username;
  final TextInputType keyboard;
  final String type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else {
          if (type == "email" &&
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            return 'Please enter correct email';
          }
        }
        return null;
      },
      keyboardType: keyboard,
      maxLength: username ? 18 : 50,
      decoration: InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
