// ignore_for_file: unused_local_variable, avoid_print, curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  final double price;
  final double tax;
  double quantity;
  int initail;

  CartItem(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.quantity,
      required this.tax,
      required this.initail});
}

class Cart with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  double get totalSelectedQuantityPrice {
    var tcp = 0.0;
    /*_items.forEach((CartItem cartItem) {
      tcp += cartItem.price * cartItem.initail;
    });*/
    tcp += _items.first.price * _items.first.initail;
    return tcp;
  }

  double get totalamout {
    var total = 0.0;
    if (_items.isNotEmpty) {
      _items.forEach((CartItem cartItem) {
        total += (totalSelectedQuantityPrice * cartItem.quantity);
      });
    }
    return total;
  }

  double get itemTax {
    var totalTax = 0.0;
    _items.forEach((CartItem cartItem) {
      totalTax = totalamout * cartItem.tax;
    });
    return totalTax;
  }

  double get toPay {
    var totalPay = 0.0;
    if (_items.isNotEmpty) {
      _items.forEach((CartItem cartItem) {
        totalPay = totalamout + itemTax;
      });
    }
    return totalPay;
  }

  int get incItem {
    int onChange = 1;

    _items.forEach((CartItem cartItem) {
      onChange = cartItem.initail++;
    });

    return onChange;
  }

  int get decItem {
    int onChange = 1;

    _items.forEach((CartItem cartItem) {
      onChange = cartItem.initail--;
    });

    return onChange;
  }

  void addItem(CartItem cartItem) {
    if (!_items.any((element) => element.id == cartItem.id)) {
      _items.add(cartItem);

      //log(_items.length.toString());
      notifyListeners();
    } else {}
  }

  void removeItem(CartItem cartItem) {
    _items.remove(cartItem);
    notifyListeners();
  }
}
