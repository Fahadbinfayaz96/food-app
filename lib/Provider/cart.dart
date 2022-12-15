import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  final int quantity;
  final double price;
  final double totalPrice;
  final double Tax;
  final double totalSelectedItemPrice;
  final double toPay;

  CartItem(
      {required this.id,
      required this.title,
      required this.image,
      required this.quantity,
      required this.price,
      required this.totalPrice,
      required this.Tax,
      required this.totalSelectedItemPrice,
      required this.toPay});
}

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items = {};
  Map<String, CartItem> get items {
    return {..._items!};
  }

  int get itemCount {
    return _items!.length;
  }

  void addItem(
    String productId,
    String title,
    String image,
    int quantity,
    double price,
    double totalPrice,
    double Tax,
    double totalSelectedItemPrice,
    double toPay,
  ) {
    if (_items!.containsKey(productId)) {
      _items?.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                image: existingCartItem.image,
                quantity: existingCartItem.quantity + 1,
                price: existingCartItem.price,
                totalPrice: existingCartItem.totalPrice + price,
                Tax: existingCartItem.Tax + 0.7,
                totalSelectedItemPrice:
                    existingCartItem.totalSelectedItemPrice + totalPrice,
                toPay: existingCartItem.totalSelectedItemPrice - Tax,
              ));
    } else {
      _items!.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              image: image,
              quantity: 1,
              price: price,
              totalPrice: totalPrice,
              Tax: 0.7,
              totalSelectedItemPrice: totalSelectedItemPrice,
              toPay: toPay));
    }
  }

  @override
  void notifyListeners();
}
