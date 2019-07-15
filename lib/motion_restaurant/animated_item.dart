import 'package:flutter/material.dart';

class AnimatedItem extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  AnimatedItem({this.onTap, @required this.child});

  @override
  _AnimatedItemState createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

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
          animationController.forward().then((a) {
            if (mounted)
              return animationController.reverse();
            else
              return null;
          }).then((_) {
            if (mounted) widget.onTap();
          });
        },
        child: widget.child,
      ),
    );
  }
}
