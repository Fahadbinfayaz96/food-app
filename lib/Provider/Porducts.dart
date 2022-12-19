// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import '../Models/Recommendation_Model.dart';

class products with ChangeNotifier {
  List<RecommendationModel> _items = [
    RecommendationModel(
      id: 'i1',
      image:
          'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
      ProductName: 'Chicken tikka',
      description: 'with extra spices',
      time: 30,
      rate: 2.00,
      rating: 5.0,
    ),
    RecommendationModel(
      id: 'i2',
      image:
          'https://media.istockphoto.com/photos/cherry-trio-with-stem-and-leaf-picture-id157428769?s=612x612',
      ProductName: 'Chicken biryani',
      description: 'extra spicy',
      time: 20,
      rate: 1.00,
      rating: 4.5,
    ),
    RecommendationModel(
      id: 'i3',
      image:
          'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
      ProductName: 'Mutton biryani',
      description: 'extra spicy',
      time: 35,
      rate: 3.00,
      rating: 4.5,
    ),
  ];

  List<RecommendationModel> get items {
    return [..._items];
  }

  void addProducts() {
    // _items.add();
    notifyListeners();
  }

  map(Null Function(dynamic e) param0) {}
}
