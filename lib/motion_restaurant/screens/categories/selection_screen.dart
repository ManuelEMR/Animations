import 'package:animations/motion_restaurant/animated_item.dart';
import 'package:animations/motion_restaurant/category_item.dart';
import 'package:animations/motion_restaurant/circle_button.dart';
import 'package:animations/motion_restaurant/clippers/plate_curve_clipper.dart';
import 'package:animations/motion_restaurant/clippers/triangle_curve_clipper.dart';
import 'package:animations/motion_restaurant/main_screen.dart';
import 'package:animations/motion_restaurant/screens/categories/category_item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FoodItem {
  final String name;
  final int quantity;

  FoodItem(this.name, this.quantity);
}

class SelectionScreen extends StatelessWidget {
  final ValueChanged<FoodItem> onFoodTap;

  const SelectionScreen({
    Key key,
    this.onFoodTap,
    @required this.dummyItems,
  }) : super(key: key);

  final List<FoodItem> dummyItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 100, bottom: 40),
      separatorBuilder: (_, __) => SizedBox(
        height: 25,
      ),
      itemBuilder: (_, index) {
        final clipper =
            index % 2 == 0 ? TriangleCurveClipper() : PlateCurveClipper();
        return ScaleTapAnim(
          onTapUp: () => onFoodTap(dummyItems[index]),
          child: CategoryItem(
            centerHeight: kInfoHeight,
            rightHeight: kCircleButtonSize,
            leftHeight: kDefaultPlateSize,
            left: Plate(
              dishClipper: clipper,
            ),
            center: Info(
              foodItem: dummyItems[index],
            ),
            right: IconCircleButton(
              onPressed: () => print('Do Something'),
              icon: Icons.chevron_right,
            ),
          ),
        );
      },
      itemCount: dummyItems.length,
    );
  }
}
