import 'dart:developer';

import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(CartItem cartItem) {
    if (!_items.contains(cartItem)) {
      _items.add(cartItem);
      log(_items.length.toString());
      notifyListeners();
    } else {}
  }
}
