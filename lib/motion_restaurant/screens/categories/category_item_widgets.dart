import 'package:animations/motion_restaurant/screens/categories/selection_screen.dart';
import 'package:flutter/material.dart';

class Plate extends StatelessWidget {
  final CustomClipper<Path> dishClipper;
  final double size;
  final IconData icon;

  const Plate(
      {Key key,
      this.size = 85,
      @required this.dishClipper,
      this.icon = Icons.fastfood})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: PhysicalShape(
        clipper: dishClipper,
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        color: Colors.white,
        shadowColor: Colors.black,
        child: Icon(icon, size: size * 0.5,),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CircleButton({Key key, @required this.onPressed, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 10,
        shape: CircleBorder(),
        fillColor: Colors.white,
        child: child,
      ),
    );
  }
}

class Info extends StatelessWidget {
  final FoodItem foodItem;

  const Info({Key key, @required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            foodItem.name,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.left,
          ),
          Text(
            '${foodItem.quantity} items',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
