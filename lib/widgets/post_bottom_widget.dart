import 'package:expandable_text/expandable_text.dart';

import 'package:flutter/material.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';

class PostBottomWidget extends StatelessWidget {
  const PostBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          left: width / 30, bottom: width / 40, right: width / 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "dcguhbdckcd",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: width / 19),
          ),
          SizedBox(
            height: height / 70,
          ),
          ExpandableText(
            "video goes here for more  gcy cbdcbcdk  bhdcb dicwbdhidcwbiwcd wci cewi cwi wci wci cwi w wcwehhhhhhhhhhhhhhhhhhhhhhhhhhhhh djbwccc ",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: width / 23),
            expandText: 'more',
            collapseText: 'less',
            expandOnTextTap: true,
            maxLines: 2,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
          const MySizedBox70(),
          Container(
            padding: EdgeInsets.only(left: width / 20),
            width: width / 1.1,
            height: height / 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Add your comment",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: width / 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
