import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LikenAnimation extends StatefulWidget {
  @override
  _LikenAnimationState createState() => _LikenAnimationState();
}

class _LikenAnimationState extends State<LikenAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "resources/lottie_animations/liken_animation.json",
      controller: _controller,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward();
      },
    );
  }
}
