import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lobopunk/widgets/like_animation.dart';
import 'package:lobopunk/widgets/mysizedbox.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';

String imgurl1 =
    "https://media.zigcdn.com/media/content/2022/May/179348629-210414-01_002-1200x493_720x540.jpg";

class PostSideBar extends StatelessWidget {
  final Widget likeButtonWidget;
  const PostSideBar({
    super.key,
    required this.likeButtonWidget,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
              onPressed: () {},
              icon: Icon(
                Icons.heart_broken_outlined,
                size: width / 11,
                color: Colors.white,
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
        ),
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
