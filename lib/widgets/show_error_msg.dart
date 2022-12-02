import 'package:flutter/material.dart';

class ShowErrorWidget extends StatelessWidget {
  const ShowErrorWidget(
      {super.key,
      required this.content,
      required this.tilecolor,
      required this.onclose});
  final String content;
  final Color tilecolor;
  final VoidCallback onclose;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: tilecolor, borderRadius: BorderRadius.circular(30)),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 30,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
              child: Text(
            content,
          )),
          Center(
            child: IconButton(
              onPressed: onclose,
              icon: const Icon(Icons.close),
            ),
          )
        ],
      ),
    );
    ;
  }
}
