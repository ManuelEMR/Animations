import 'package:flutter/material.dart';

class TriangleCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    
    final botPoint = Offset(size.width * 0.22, size.height * 0.98);
    final topPoint = Offset(size.width * 0.22, size.height * 0.02);
    final rightPoint = Offset(size.width, size.height * 0.5);
    final leftControlPoint = Offset(size.width * 0.05, size.height * 0.5); 
    final botControlPoint = Offset(size.width * 0.65, size.height * 0.9);
    final topControlPoint = Offset(size.width * 0.65, size.height * 0.1);

    path.moveTo(topPoint.dx, topPoint.dy);
    path.quadraticBezierTo(leftControlPoint.dx, leftControlPoint.dy, botPoint.dx, botPoint.dy);
    path.quadraticBezierTo(botControlPoint.dx, botControlPoint.dy, rightPoint.dx, rightPoint.dy);
    path.quadraticBezierTo(topControlPoint.dx, topControlPoint.dy, topPoint.dx, topPoint.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}