import 'package:flutter/material.dart';

class PlateCurveClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final path = Path();

    final leftBorder = size.width * 0.05;
    final topBorder = size.height * 0.05;
    final botBorder = size.height * 0.95;
    final rightBorder = size.width * 0.95;
    final verFirstY = size.height * 0.35;
    final verSecondY = size.height * 0.65;
    final horFirstX = size.width * 0.35;
    final horSecondX = size.width * 0.65;


    final initialPoint = Offset(horFirstX, topBorder);
    final leftFirstPoint = Offset(leftBorder, verFirstY);
    final botFirstPoint = Offset(horFirstX, botBorder);
    final rightFirstPoint = Offset(rightBorder, verSecondY);
    final topFirstPoint = Offset(horSecondX, topBorder);

    path.moveTo(initialPoint.dx, initialPoint.dy);
    path.quadraticBezierTo(size.width * 0.08, size.height * 0.08, leftFirstPoint.dx, leftFirstPoint.dy);
    path.lineTo(leftBorder, verSecondY);
    path.quadraticBezierTo(size.width * 0.08, size.height * 0.92, botFirstPoint.dx, botFirstPoint.dy);
    path.lineTo(horSecondX, botBorder);
    path.quadraticBezierTo(size.width * 0.92, size.height * 0.92, rightFirstPoint.dx, rightFirstPoint.dy);
    path.lineTo(rightBorder, verFirstY);
    path.quadraticBezierTo(size.width * 0.92, size.height * 0.08, topFirstPoint.dx, topFirstPoint.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}