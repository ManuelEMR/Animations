import 'package:animations/motion_restaurant/cart_state.dart';
import 'package:animations/motion_restaurant/screens/categories/selection_screen.dart';
import 'package:animations/motion_restaurant/screens/menu/menu_screen.dart';

const dummyItems = [
  FoodCategoryItem("Pizza", 33),
  FoodCategoryItem("Salads", 33),
  FoodCategoryItem("Desserts", 22),
  FoodCategoryItem("Pasta", 18),
  FoodCategoryItem("Beverages", 15),
];

const dummyMenuItems = [
  MenuItem('Fried rice with egg and onions', _largeDescription, 4, 250, 7.50),
  MenuItem('Savannah chopped salad', _largeDescription, 3, 300, 3.00),
  MenuItem('Autumn carven Turkey salad', _largeDescription, 4, 250, 8.99),
];

final dummyCartItems = [
  CartItem(dummyMenuItems[0], 1),
  CartItem(dummyMenuItems[1], 1),
  CartItem(dummyMenuItems[2], 1)
];

const _largeDescription =
    'The secret to the best Chinese fried rice is onions, garlic and sesame oil, you may add in cooked chicken, beef, pork or shrimp, also you may add in some frozen thawed peas or fresh sauteed or canned mushrooms, whatever you have handy in your fridge!';
