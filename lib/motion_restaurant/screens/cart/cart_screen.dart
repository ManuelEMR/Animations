import 'dart:math';

import 'package:animations/motion_restaurant/category_item.dart';
import 'package:animations/motion_restaurant/clippers/plate_curve_clipper.dart';
import 'package:animations/motion_restaurant/main_screen.dart';
import 'package:animations/motion_restaurant/screens/categories/category_item_widgets.dart';
import 'package:animations/motion_restaurant/screens/menu/category_item_widgets.dart';
import 'package:animations/motion_restaurant/title.dart';
import 'package:animations/motion_restaurant/utils.dart';
import 'package:flutter/material.dart';

const double kToggleStepperSize = 112;

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 30),
      itemBuilder: (context, index) {
        if (index == 0) return SectionTitle(title: 'Shopping Cart');

        return CategoryItem(
          centerHeight: 157,
          rightHeight: kToggleStepperSize,
          leftHeight: 110,
          left: Plate(
            size: 110,
            dishClipper: PlateCurveClipper(),
          ),
          center: PlateInfo(
            menuItem: dummyMenuItems[index - 1],
          ),
          right: _ToggleStepper(),
        );
      },
      separatorBuilder: (context, index) {
        if (index == 0) return const SizedBox(height: 32);
        return const SizedBox(height: 24);
      },
      itemCount: dummyMenuItems.length + 1,
    );
  }
}

class _ToggleStepper extends StatefulWidget {
  @override
  _ToggleStepperState createState() => _ToggleStepperState();
}

class _ToggleStepperState extends State<_ToggleStepper> {

  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(  
      width: 40,
      height: kToggleStepperSize,
      child: Material(
        elevation: 10,
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20)),
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: _substract,
            ),
            Text(_counter.toString()),
            IconButton(
              icon: Icon(Icons.add, color: mainColor,),
              onPressed: _add,
            ),
          ],
        ),
      ),
    );
  }

  void _add() {
    setState(() {
      _counter++;
    });
  }

  void _substract() {
    setState(() {
      _counter = max(0, _counter - 1);
    });
  }
}
