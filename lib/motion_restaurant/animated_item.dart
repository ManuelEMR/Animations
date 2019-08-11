import 'package:flutter/material.dart';

class ScaleTapAnim extends StatefulWidget {
  final Widget child;
  final VoidCallback onTapUp;
  final VoidCallback onTapDown;

  ScaleTapAnim({this.onTapDown, this.onTapUp, @required this.child});

  @override
  _ScaleTapAnimState createState() => _ScaleTapAnimState();
}

class _ScaleTapAnimState extends State<ScaleTapAnim>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  TickerFuture _animationFuture;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 50));
    animation = Tween<double>(begin: 1, end: 0.9).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: animation.value,
      child: GestureDetector(
        onTapDown: (details) {
          _animationFuture = animationController.forward();
          if (widget.onTapDown != null ) widget.onTapDown();
        },
        onTapUp: (details) {
          if (mounted) {
            _animationFuture?.then((_) =>
                animationController.reverse()
            )?.then((_) {
              if (mounted) widget.onTapUp();
            });
          }
        },
        child: widget.child,
      ),
    );
  }
}
