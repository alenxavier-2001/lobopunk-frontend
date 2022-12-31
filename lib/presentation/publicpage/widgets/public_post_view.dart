import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/core/basic_scafoldmsg.dart';
import 'package:lobopunk/core/common_notifer.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/post/post_impl.dart';
import 'package:lobopunk/presentation/home/home_screen.dart';
import 'package:lobopunk/widgets/post_widget.dart';

class PostPageView extends StatelessWidget {
  final int pagenumber;
  const PostPageView({super.key, required this.pagenumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: postListNotifier,
            builder: (context, List<PostModel> value, _) {
              List<PostModel> userposts = value;
              return PageView.builder(
                  controller: PageController(initialPage: pagenumber),
                  onPageChanged: (int page) {
                    int len = userposts.length;
                    int pageno = (len / 10).round();

                    if ((userposts.length - 2) == page) {
                      PostImplementation()
                          .continuePost(userposts[page].id.toString(), pageno);
                    }
                    snappedindexhome.value = page;
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: userposts.length,
                  itemBuilder: (context, index) {
                    return PostWidget(
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
