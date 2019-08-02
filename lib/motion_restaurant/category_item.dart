import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Widget left;
  final Widget right;
  final Widget center;

  const CategoryItem(
      {@required this.left, @required this.right, @required this.center});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.circular(25),
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: center
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.1 - 15,
          child: right,
        ),
        Positioned(left: 5, child: left)
      ],
    );
  }
}
