import 'package:animations/motion_restaurant/main_screen.dart';
import 'package:animations/motion_restaurant/screens/selection_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CustomClipper<Path> dishClipper;
  final FoodItem foodItem;

  const CategoryItem({this.dishClipper, @required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.circular(25),
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 70),
            child: _Info(foodItem: foodItem),
          ),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.1 - 15,
          child: _RightArrow(),
        ),
        Positioned(
            left: 5,
            child: Container(
              width: 85,
              height: 85,
              child: PhysicalShape(
                clipper: dishClipper,
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                color: Colors.white,
                shadowColor: Colors.black,
                child: Icon(Icons.fastfood),
              ),
            ))
      ],
    );
  }
}

class _RightArrow extends StatelessWidget {
  const _RightArrow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      child: RawMaterialButton(
        onPressed: () => print('Right'),
        elevation: 10,
        shape: CircleBorder(),
        fillColor: Colors.white,
        child: Icon(
          Icons.chevron_right,
          color: mainColor,
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final FoodItem foodItem;

  const _Info({Key key, @required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
