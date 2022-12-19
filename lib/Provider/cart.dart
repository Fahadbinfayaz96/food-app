// ignore_for_file: unused_local_variable, avoid_print, curly_braces_in_flow_control_structures, avoid_function_literals_in_foreach_calls

import 'dart:developer';

import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  final double price;
  final double tax;
  double quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.tax,
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

  double get totalamout {
    var total = 0.0;
    if (_items.isNotEmpty) {
      for (var cartItem in _items) {
        total += (cartItem.price * cartItem.quantity);
      }
    }
    return total;
  }

  double get itemTax {
    var totalTax = 0.0;
    for (var cartItem in _items) {
      totalTax = totalamout * cartItem.tax;
    }
    return totalTax;
  }

  double get toPay {
    var totalPay = 0.0;
    if (_items.isNotEmpty) {
      for (var cartItem in _items) {
        totalPay = totalamout + itemTax;
      }
    }
    return totalPay;
  }

  void increaseQuantity(CartItem cartItem) {
    cartItem.quantity++;

    notifyListeners();
  }

  void decreaseQuantity(CartItem cartItem) {
    cartItem.quantity--;
    notifyListeners();
  }

  void addItem(CartItem cartItem) {
    if (!_items.any((element) => element.id == cartItem.id)) {
      _items.add(cartItem);
      notifyListeners();
    } else {}
  }

  void removeItem(CartItem cartItem) {
    _items.remove(cartItem);
    notifyListeners();
  }
}
