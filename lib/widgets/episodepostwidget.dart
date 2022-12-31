import 'package:flutter/material.dart';
import 'package:lobopunk/core/common_notifer.dart';
import 'package:lobopunk/core/post_notifier.dart';

import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/post/post_impl.dart';
import 'package:lobopunk/presentation/home/home_screen.dart';
import 'package:lobopunk/widgets/post_widget.dart';

class EpisodePostWidget extends StatelessWidget {
  final int index;
  final bool isRight;
  final bool isLeft;

  const EpisodePostWidget(
      {super.key,
      required this.index,
      required this.isRight,
      required this.isLeft});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: postListNotifier,
            builder: (context, List<PostModel> value, _) {
              List<PostModel> userposts = value;
              return PageView.builder(
                  controller: PageController(initialPage: index),
                  onPageChanged: (int page) {
                    int len = userposts.length;
                    int pageno = (len / 10).round();

                    if ((userposts.length) == page) {
                      PostImplementation()
                          .continuePost(userposts[page].id.toString(), pageno);
                    }
                    snappedindexhome.value = page;
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: userposts.length,
                  itemBuilder: (context, index) {
                    return PostWidget(
                        isLeft: isLeft,
                        isRight: isRight,
                        index: index,
                        data: userposts[index],
                        url: (qualityNotifier.value == "High")
                            ? "${userposts[index].highvideourl}"
                            : (qualityNotifier.value == "Medium")
                                ? "${userposts[index].midvideourl}"
                                : "${userposts[index].lowvideourl}");
                  });
            }));
  }
}
