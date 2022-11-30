import 'package:expandable_text/expandable_text.dart';

import 'package:flutter/material.dart';

class PostBottomWidget extends StatelessWidget {
  const PostBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "dcguhbdckcd",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: width / 20),
        ),
        SizedBox(
          height: height / 70,
        ),
        ExpandableText(
          "video goes here for more  gcy cbdcbcdk  bhdcb dicwbdhidcwbiwcd wci cewi cwi wci wci cwi w wcwehhhhhhhhhhhhhhhhhhhhhhhhhhhhh djbwccc ",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: width / 22),
          expandText: 'more',
          collapseText: 'less',
          expandOnTextTap: true,
          maxLines: 2,
          collapseOnTextTap: true,
          linkColor: Colors.grey,
        ),
        SizedBox(
          height: height / 100,
        )
      ],
    );
  }
}
