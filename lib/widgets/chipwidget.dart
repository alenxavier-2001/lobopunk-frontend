import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback cancel;
  const ChipWidget(
      {super.key,
      required this.label,
      required this.color,
      required this.cancel});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      onDeleted: cancel,
      backgroundColor: color,
      elevation: 2.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(3.0),
    );
  }
}
