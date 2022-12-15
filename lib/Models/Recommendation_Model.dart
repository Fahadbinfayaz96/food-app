// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies

import 'dart:core';

class RecommendationModel {
  final String id;
  final String image;
  final String ProductName;
  final String description;
  final int time;
  final double rate;
  final double rating;
  RecommendationModel(
      {required this.id,
      required this.image,
      required this.ProductName,
      required this.description,
      required this.time,
      required this.rating,
      required this.rate}) {}
}
