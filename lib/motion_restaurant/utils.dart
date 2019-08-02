import 'package:animations/motion_restaurant/screens/categories/selection_screen.dart';
import 'package:animations/motion_restaurant/screens/menu/menu_screen.dart';

final dummyItems = [
  FoodItem("Pizza", 25),
  FoodItem("Salads", 30),
  FoodItem("Desserts", 30),
  FoodItem("Pasta", 44),
  FoodItem("Beverages", 30),
];

final dummyMenuItems = [
  MenuItem('Fried rice with egg and onions', _largeDescription, 4, 250, 7.50),
  MenuItem('Savannah chopped salad', _largeDescription, 3, 300, 3.00),
  MenuItem('Autumn carven Turkey salad', _largeDescription, 4, 250, 8.99),
];

final _largeDescription =
    'The secret to the best Chinese fried rice is onions, garlic and sesame oil, you may add in cooked chicken, beef, pork or shrimp, also you may add in some frozen thawed peas or fresh sauteed or canned mushrooms, whatever you have handy in your fridge!';
