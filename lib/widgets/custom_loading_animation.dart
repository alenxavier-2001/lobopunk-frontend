import 'dart:math';

import 'package:flutter/material.dart';

class CustomLoadingAnimation extends StatefulWidget {
  const CustomLoadingAnimation({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomLoadingAnimation> createState() => _CustomLoadingAnimationState();
}

class _CustomLoadingAnimationState extends State<CustomLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
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
      child: Stack(children: const [
        SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 30,
          ),
        ),
        CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage("assets/logo.jpg"),
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
