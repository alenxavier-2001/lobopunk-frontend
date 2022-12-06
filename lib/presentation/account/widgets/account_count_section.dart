import 'package:flutter/material.dart';
import 'package:lobopunk/core/k_m_b_converter.dart';

class AccountCountSection extends StatelessWidget {
  const AccountCountSection({
    Key? key,
    required this.count,
    required this.text,
  }) : super(key: key);

  final int count;
  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          kmbgenerator(count),
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: width / 17),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: width / 22,
              color: Colors.grey,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
