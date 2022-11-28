import 'dart:math';

import 'package:flutter/material.dart';

String imgurl1 =
    "https://media.zigcdn.com/media/content/2022/May/179348629-210414-01_002-1200x493_720x540.jpg";

class PostSideBar extends StatelessWidget {
  const PostSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _profileImageButton(),
        Icon(
          Icons.logo_dev,
          size: 40,
        ),
        Icon(
          Icons.comment,
          size: 40,
        ),
        Icon(
          Icons.share,
          size: 40,
        ),
        SizedBox(
          height: height / 50,
          width: width / 7,
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
          angle: 2 * pi * _animationController.value,
          child: child,
        );
      },
    );
  }
}
