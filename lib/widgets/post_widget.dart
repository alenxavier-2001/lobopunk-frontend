import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/comment/comment_bloc.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';

import 'package:lobopunk/domain/posts/post_services.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/post/post_impl.dart';
import 'package:lobopunk/presentation/home/home_screen.dart';
import 'package:lobopunk/widgets/episodepostwidget.dart';
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
    this.isRight = false,
    this.isLeft = false,
    this.ispost2 = false,
  }) : super(key: key);

  final int index;
  final PostModel data;
  final String url;
  final bool isRight;
  final bool isLeft;
  final bool ispost2;

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
    bool isreported = false;
    widget.data.report!.forEach(
      (element) {
        if (element['userid'] == constusermodel.value.id) {
          isreported = true;
        }
      },
    );
    return (isreported)
        ? const Center(
            child: Text("This post is reportrd by you"),
          )
        : ValueListenableBuilder(
            valueListenable: snappedindexhome,
            builder: (context, int snapindex, _) {
              return GestureDetector(
                onHorizontalDragEnd: ((details) async {
                  if (details.primaryVelocity!.compareTo(0) == -1) {
                    if (widget.data.nextpost != "") {
                      if (widget.isRight == false) {
                        final rs = await PostImplementation()
                            .getPostid(widget.data.nextpost.toString());

                        rs.fold((MainFailure failure) {}, (PostModel res) {
                          // log(res.description.toString());
                          postListNotifier.value =
                              List.from(postListNotifier.value)
                                ..insert(widget.index - 1, res);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EpisodePostWidget(
                                        index: widget.index - 1,
                                        isLeft: widget.isLeft,
                                        isRight: true,
                                      )));
                        });
                      } else {
                        log("poped");
                        postListNotifier.value =
                            List.from(postListNotifier.value)
                              ..removeAt(widget.index);
                        Navigator.pop(context);
                      }
                    }
                  } else {
                    if (widget.data.pastpost != "") {
                      if (widget.isLeft == false) {
                        final rs = await PostImplementation()
                            .getPostid(widget.data.nextpost.toString());

                        rs.fold((MainFailure failure) {}, (PostModel res) {
                          // log(res.description.toString());
                          postListNotifier.value =
                              List.from(postListNotifier.value)
                                ..insert(widget.index + 1, res);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EpisodePostWidget(
                                        index: widget.index + 1,
                                        isLeft: true,
                                        isRight: widget.isRight,
                                      )));
                        });
                      } else {
                        log("poped");
                        postListNotifier.value =
                            List.from(postListNotifier.value)
                              ..removeAt(widget.index);
                        Navigator.pop(context);
                      }
                    }
                  }
                }),
                onDoubleTap: () {
                  setState(() {
                    isLikeAnimating = true;
                  });
                },
                child: Container(
                  color: Colors.black,
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
                                builder:
                                    (context, List<PostModel> postlist, _) {
                                  PostModel postdata = postlist[widget.index];
                                  return Expanded(
                                    child: SizedBox(
                                      height: height / 1.07,
                                      child: PostSideBar(
                                        ispost2: widget.ispost2,
                                        index: widget.index,
                                        likeButtonWidget: LikeAnimation(
                                          smallLike: false,
                                          isAnimating: true,
                                          child: InkWell(
                                              onTap: () {
                                                if ((postdata.like!.contains(
                                                    constusermodel.value.id))) {
                                                } else {
                                                  PostImplementation().likePost(
                                                      widget.data.id.toString(),
                                                      widget.index,
                                                      widget.ispost2);
                                                }
                                              },
                                              child: Icon(
                                                (postdata.like!.contains(
                                                        constusermodel
                                                            .value.id))
                                                    ? Icons.favorite_rounded
                                                    : Icons
                                                        .favorite_border_outlined,
                                                size: width / 11,
                                                color: (postdata.like!.contains(
                                                        constusermodel
                                                            .value.id))
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
                                  if ((postdata.like!
                                      .contains(constusermodel.value.id))) {
                                  } else {
                                    PostImplementation().likePost(
                                        widget.data.id.toString(),
                                        widget.index,
                                        widget.ispost2);
                                  }
                                },
                                child: const Icon(Icons.favorite_sharp,
                                    color: Colors.white, size: 100),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              );
            });
  }
}
