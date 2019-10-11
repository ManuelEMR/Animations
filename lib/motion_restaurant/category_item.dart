import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final double centerHeight;
  final double rightHeight;
  final double leftHeight;
  final Widget left;
  final Widget right;
  final Widget center;

  const CategoryItem(
      {@required this.centerHeight,
      @required this.rightHeight,
      @required this.leftHeight,
      @required this.left,
      @required this.right,
      @required this.center});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Material(
            borderRadius: BorderRadius.circular(25),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            child: center),
        Positioned(
          bottom: centerHeight / 2 - rightHeight / 2,
          right: 22,
          child: right,
        ),
        Positioned(
          left: 5,
          top: centerHeight / 2 - leftHeight / 2,
          child: left,
        )
      ],
    );
  }
}
