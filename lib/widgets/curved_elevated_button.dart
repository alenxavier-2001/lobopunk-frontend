import 'package:flutter/material.dart';

class CurvedElevatedButton extends StatelessWidget {
  const CurvedElevatedButton({
    Key? key,
    required this.text,
    required this.background,
    required this.onpress,
  }) : super(key: key);
  final String text;
  final Color background;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            backgroundColor: MaterialStateProperty.all<Color>(background),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ))),
        onPressed: onpress,
        child: Text(
          text,
          style: TextStyle(fontSize: width / 21),
        ));
  }
}
