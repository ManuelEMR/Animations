import 'package:animations/motion_restaurant/category_item.dart';
import 'package:animations/motion_restaurant/circle_button.dart';
import 'package:animations/motion_restaurant/clippers/plate_curve_clipper.dart';
import 'package:animations/motion_restaurant/screens/categories/category_item_widgets.dart';
import 'package:animations/motion_restaurant/screens/menu/category_item_widgets.dart';
import 'package:animations/motion_restaurant/title.dart';
import 'package:animations/motion_restaurant/utils.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String description;
  final int rating;
  final int weigth;
  final double price;

  const MenuItem(
      this.title, this.description, this.rating, this.weigth, this.price);
}

class MenuScreen extends StatefulWidget {
  final VoidCallback onAddTapped;

  const MenuScreen({@required this.onAddTapped});
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final double circleButtonSize = 40;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 30),
      itemBuilder: (context, index) {
        if (index == 0) return SectionTitle(title: 'Salads Menu');

        return CategoryItem(
          centerHeight: 157,
          rightHeight: circleButtonSize,
          leftHeight: 110,
          left: Plate(
            size: 110,
            dishClipper: PlateCurveClipper(),
          ),
          center: PlateInfo(
            menuItem: dummyMenuItems[index - 1],
          ),
          right: IconCircleButton(
            size: circleButtonSize,
            onPressed: widget.onAddTapped,
            icon: Icons.add,
          ),
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
