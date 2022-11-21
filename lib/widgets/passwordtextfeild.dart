import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PasswordTextFeild extends StatefulWidget {
  final String hinttext;
  final TextEditingController controller;
  const PasswordTextFeild(
      {super.key, required this.controller, required this.hinttext});

  @override
  State<PasswordTextFeild> createState() => _PasswordTextFeildState();
}

class _PasswordTextFeildState extends State<PasswordTextFeild> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: widget.controller,
      obscureText: !_passwordVisible, //This will obscure text dynamically
      decoration: InputDecoration(
        hintText: widget.hinttext,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
    ;
  }
}
