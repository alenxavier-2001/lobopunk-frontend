import 'package:flutter/material.dart';

class CurvedElevatedButton extends StatelessWidget {
  const CurvedElevatedButton({
    Key? key,
    required this.text,
    required this.background,
    required this.onpress,
    this.fontColor = Colors.black,
  }) : super(key: key);
  final String text;
  final Color background;
  final VoidCallback onpress;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.all(width / 80)),
            backgroundColor: MaterialStateProperty.all<Color>(background),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ))),
        onPressed: onpress,
        child: Text(
          text,
          style: TextStyle(fontSize: width / 21, color: fontColor),
        ));
  }
}
