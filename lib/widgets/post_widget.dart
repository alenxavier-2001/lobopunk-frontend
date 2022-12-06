import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/presentation/home/home_screen.dart';
import 'package:lobopunk/widgets/like_animation.dart';
import 'package:lobopunk/widgets/post_bottom_widget.dart';
import 'package:lobopunk/widgets/post_side_bar.dart';
import 'package:lobopunk/widgets/video_tile_widget.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  final int index;
  final PostModel data;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLikeAnimating = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: snappedindexhome,
        builder: (context, int snapindex, _) {
          log("$kBaseurl${widget.data.midvideourl}");
          return GestureDetector(
            onDoubleTap: () {
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Stack(alignment: Alignment.bottomCenter, children: [
                  VideoTileWidget(
                    url: "$kBaseurl${widget.data.midvideourl}",
                    currentIndex: widget.index,
                    snappedPageIndex: snapindex,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 6,
                        child: SizedBox(
                          height: height / 2,
                          width: width / 1.1,
                          child: const PostBottomWidget(),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: height / 1.75,
                          child: PostSideBar(
                            likeButtonWidget: LikeAnimation(
                              smallLike: false,
                              isAnimating: true,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    size: width / 11,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 100),
                  opacity: isLikeAnimating ? .8 : 0,
                  child: LikeAnimation(
                    child: Icon(Icons.favorite_sharp,
                        color: Colors.white, size: 100),
                    isAnimating: isLikeAnimating,
                    duration: Duration(milliseconds: 100),
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                      });
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}
