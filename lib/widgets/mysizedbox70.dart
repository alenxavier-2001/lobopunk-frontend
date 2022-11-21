import 'package:flutter/material.dart';

class MySizedBox70 extends StatelessWidget {
  const MySizedBox70({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 70,
    );
  }
}
