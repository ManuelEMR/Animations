import 'package:animations/motion_restaurant/animated_item.dart';
import 'package:animations/motion_restaurant/main_screen.dart';
import 'package:flutter/material.dart';

const double kCircleButtonSize = 35;

class IconCircleButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;

  const IconCircleButton(
      {Key key,
      this.size = kCircleButtonSize,
      @required this.onPressed,
      @required this.icon})
      : super(key: key);

  @override
  _IconCircleButtonState createState() => _IconCircleButtonState();
}

class _IconCircleButtonState extends State<IconCircleButton> {
  var _fillColor = Colors.white;
  var _iconColor = mainColor;

  void _changeColors() {
    setState(() {
      _fillColor = mainColor;
      _iconColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTapAnim(
      onTapDown: _changeColors,
      onTapUp: widget.onPressed,
      child: Container(
        height: widget.size,
        width: widget.size,
        child: Material(
          elevation: 10,
          shape: CircleBorder(),
          color: _fillColor,
          child: Icon(
            widget.icon,
            color: _iconColor,
          ),
        ),
      ),
    );
  }
}
