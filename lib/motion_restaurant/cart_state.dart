import 'package:animations/motion_restaurant/screens/menu/menu_screen.dart';
import 'package:animations/motion_restaurant/utils.dart';
import 'package:flutter/cupertino.dart';

class CartState with ChangeNotifier {

  List<CartItem> _cartItems = dummyCartItems;
  List<CartItem> get cartItems => _cartItems;
  int _cartItemCount = 0;
  int get cartItemCount => _cartItemCount; 

  void addItem(MenuItem item) {

    if (_cartItems.any((i) => i.foodItem == item)) {
      final index = _cartItems.indexWhere((i) => i.foodItem == item);
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(item, 1));
    }

    _cartItemCount = _cartItems.length;
    notifyListeners();
  }

  void removeItem(MenuItem item) {

    if (_cartItems.any((i) => i.foodItem == item)) {
      final index = _cartItems.indexWhere((i) => i.foodItem == item);
      _cartItems[index].quantity--;

      if (_cartItems[index].quantity == 0) {
        _cartItems.removeAt(index);
      }
    }

    _cartItemCount = _cartItems.length;
    notifyListeners();
  }
}


class CartItem {
  MenuItem foodItem;
  int quantity;

  CartItem(this.foodItem, this.quantity);
}