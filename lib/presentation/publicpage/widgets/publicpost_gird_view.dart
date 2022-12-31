import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/presentation/publicpage/public_screen.dart';
import 'package:lobopunk/presentation/publicpage/widgets/public_post_view.dart';
import 'package:lobopunk/presentation/publicpage/widgets/public_post_widget.dart';

class PublicPostGirdView extends StatelessWidget {
  final List<PostModel> postlist;
  const PublicPostGirdView({
    Key? key,
    required this.postlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: postlist.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              postListNotifier.value = postlist;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostPageView(
                            pagenumber: index,
                          )));
            },
            child: PublicPostWidget(
                url: "$kBaseurl${postlist[index].thumbnailurl}"),
          );
        });
  }
}
