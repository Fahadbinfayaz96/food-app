// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_big_plate/DetailedProductScreen.dart';
import 'package:my_big_plate/Provider/Porducts.dart';
import 'package:my_big_plate/Provider/cart.dart';
import 'package:my_big_plate/RecommendationScreen.dart';
import 'package:provider/provider.dart';
import 'package:my_big_plate/DetailedProductScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: recommondationPage(),
      ),
    );
  }
}
