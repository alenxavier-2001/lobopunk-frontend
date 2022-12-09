import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/post/post_impl.dart';
import 'package:lobopunk/widgets/like_animation.dart';
import 'package:lobopunk/widgets/mysizedbox.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';

String imgurl1 =
    "https://media.zigcdn.com/media/content/2022/May/179348629-210414-01_002-1200x493_720x540.jpg";

class PostSideBar extends StatelessWidget {
  final Widget likeButtonWidget;
  final int index;
  const PostSideBar({
    super.key,
    required this.likeButtonWidget,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ValueListenableBuilder(
            valueListenable: postListNotifier,
            builder: (context, List<PostModel> postlist, _) {
              PostModel postdata = postlist[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert_outlined,
                        size: width / 11,
                        color: Colors.white,
                      )),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.monetization_on_outlined,
                      size: width / 11,
                      color: Colors.white,
                    ),
                  ),
                  const MySizedBox70(),
                  likeButtonWidget,
                  const MySizedBox70(),
                  IconButton(
                    onPressed: () {
                      if ((postdata.dislike!.contains(constusermodel.id))) {
                      } else {
                        PostImplementation()
                            .dislikePost(postdata.id.toString(), index);
                      }
                    },
                    icon: Icon(
                      (postdata.dislike!.contains(constusermodel.id))
                          ? Icons.heart_broken_rounded
                          : Icons.heart_broken_outlined,
                      size: width / 11,
                      color: (postdata.dislike!.contains(constusermodel.id))
                          ? Colors.redAccent
                          : Colors.white,
                    ),
                  ),
                  const MySizedBox70(),
                  InkWell(
                    onTap: () {},
                    child: Transform.rotate(
                      angle: 180 * math.pi / 100,
                      child: Icon(
                        Icons.send_outlined,
                        size: width / 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const MySizedBox(),
                  const MySizedBox(),
                  const MySizedBox(),
                ],
              );
            }),
      ],
    );
  }

  _profileImageButton() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: NetworkImage(imgurl1), fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: -10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.add,
                size: 20,
              ),
            ))
      ],
    );
  }
}

class AnimatedRoundWidget extends StatefulWidget {
  const AnimatedRoundWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedRoundWidget> createState() => _AnimatedRoundWidgetState();
}

class _AnimatedRoundWidgetState extends State<AnimatedRoundWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          height: 50,
          width: 50,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 50,
          ),
        ),
        CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage(imgurl1),
        )
      ]),
      builder: (context, child) {
        return Transform.rotate(
          angle: 2 * math.pi * _animationController.value,
          child: child,
        );
      },
    );
  }
}
