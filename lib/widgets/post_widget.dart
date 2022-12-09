import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/posts/post_services.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/post/post_impl.dart';
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
    required this.url,
  }) : super(key: key);

  final int index;
  final PostModel data;
  final String url;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLikeAnimating = false;
  Map<String, dynamic> name = {};

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: snappedindexhome,
        builder: (context, int snapindex, _) {
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
                    url: "$kBaseurl${widget.url}",
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
                          child: PostBottomWidget(
                            data: widget.data,
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: postListNotifier,
                          builder: (context, List<PostModel> postlist, _) {
                            PostModel postdata = postlist[widget.index];
                            return Expanded(
                              child: SizedBox(
                                height: height / 1.07,
                                child: PostSideBar(
                                  index: widget.index,
                                  likeButtonWidget: LikeAnimation(
                                    smallLike: false,
                                    isAnimating: true,
                                    child: IconButton(
                                        onPressed: () {
                                          if ((postdata.like!.contains(constusermodel.id))) {
                            } else {
                              PostImplementation().likePost(
                                  widget.data.id.toString(), widget.index);
                            }
                                        },
                                        icon: Icon(
                                          (postdata.like!
                                                  .contains(constusermodel.id))
                                              ? Icons.favorite_rounded
                                              : Icons.favorite_border_outlined,
                                          size: width / 11,
                                          color: (postdata.like!
                                                  .contains(constusermodel.id))
                                              ? Colors.redAccent
                                              : Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  )
                ]),
                ValueListenableBuilder(
                    valueListenable: postListNotifier,
                    builder: (context, List<PostModel> postlist, _) {
                      PostModel postdata = postlist[widget.index];
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 100),
                        opacity: isLikeAnimating ? .8 : 0,
                        child: LikeAnimation(
                          isAnimating: isLikeAnimating,
                          duration: const Duration(milliseconds: 100),
                          onEnd: () {
                            setState(() {
                              isLikeAnimating = false;
                            });
                            if ((postdata.like!.contains(constusermodel.id))) {
                            } else {
                              PostImplementation().likePost(
                                  widget.data.id.toString(), widget.index);
                            }
                          },
                          child: const Icon(Icons.favorite_sharp,
                              color: Colors.white, size: 100),
                        ),
                      );
                    })
              ],
            ),
          );
        });
  }
}
