import 'package:flutter/material.dart';

class CoolButton extends StatelessWidget {
  final double containerHeight;
  final double buttonHeight;
  final String text;

  const CoolButton(
      {Key key, this.containerHeight, this.buttonHeight = 40, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: containerHeight - buttonHeight / 2,
      left: 40,
      right: 40,
      child: Container(
        height: buttonHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.pink, Colors.orange],
                stops: [0.4, 0.8]),
            boxShadow: [
              BoxShadow(
                  color: Colors.pink, offset: Offset(1, 1), blurRadius: 10),
              BoxShadow(
                  color: Colors.orange, offset: Offset(-1, -1), blurRadius: 10),
            ]),
        child: FlatButton(
          onPressed: () => print('Pressed'),
          child: Text(
            text.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
