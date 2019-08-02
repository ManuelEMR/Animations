import 'package:animations/motion_restaurant/category_item.dart';
import 'package:animations/motion_restaurant/clippers/plate_curve_clipper.dart';
import 'package:animations/motion_restaurant/main_screen.dart';
import 'package:animations/motion_restaurant/screens/categories/category_item_widgets.dart';
import 'package:animations/motion_restaurant/screens/menu/category_item_widgets.dart';
import 'package:animations/motion_restaurant/utils.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String description;
  final int rating;
  final int weigth;
  final double price;

  const MenuItem(this.title, this.description, this.rating, this.weigth, this.price);
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 30),
      itemBuilder: (context, index) {
        if (index == 0) return _Title();
        return CategoryItem(
          left: Plate(
            size: 110,
            dishClipper: PlateCurveClipper(),
          ),
          center: PlateInfo(menuItem: dummyMenuItems[index - 1],),
          right: CircleButton(
            onPressed: () => print('Do something else'),
            child: Icon(
              Icons.add,
              color: mainColor,
            ),
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

class _Title extends StatelessWidget {
  const _Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Salads Menu',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
