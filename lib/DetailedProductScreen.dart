// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_typing_uninitialized_variables, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_big_plate/Models/Recommendation_Model.dart';

import 'icons.dart';

class detailProduct extends StatefulWidget {
  final RecommendationModel recommendationModel;

  detailProduct({
    Key? key,
    required this.recommendationModel,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => detailProductState();
}

class detailProductState extends State<detailProduct> {
  var lables = ['Small', 'Medium', 'Large'];

  var counter = 0;

  @override
  detailProduct get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        /* leading: Icon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.black,
        ),*/
        title: Text("Detailed Product"),
        backgroundColor: Color.fromARGB(255, 253, 252, 252),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                height: 300,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 255, 169, 41).withOpacity(0.4),
                      spreadRadius: 0.1,
                      blurRadius: 7,
                      offset: Offset(0, 7))
                ], borderRadius: BorderRadius.circular(21)),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Image.network(
                    widget.recommendationModel.image.toString(), //image
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.recommendationModel.ProductName
                            .toString(), //name
                        style:
                            TextStyle(fontFamily: 'Metrolpolis', fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          MyIcons.veg,
                          color: Colors.red,
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(widget.recommendationModel.rating
                          .toString()), //rating
                      Icon(
                        Icons.star,
                        size: 12,
                        color: Color.fromARGB(255, 255, 238, 5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 58),
                        child: SizedBox(
                          height: 45,
                          width: 95,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 21, top: 9),
                              child: Text(
                                "\$ ${widget.recommendationModel.rate}", //rate
                                style: TextStyle(
                                    fontFamily: 'Metrolpolis', fontSize: 16),
                              ),
                            ),
                            elevation: 8,
                            shadowColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 5),
                    child: Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Spice',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Metrolpolis'),
                                children: [
                              TextSpan(
                                  text: ' rating',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Metrolpolis'))
                            ])),
                        Icon(
                          Icons.star,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.timer,
                        size: 18,
                      ),
                      Text(widget.recommendationModel.time.toString() +
                          " " +
                          "min") //time
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
              width: screenSize * 1,
              child: Text(
                "Description",
                style: TextStyle(fontFamily: 'Metrolpolis', fontSize: 20),
              ),
            ),
            Text(
              widget.recommendationModel.description.toString(), //Description
              style: TextStyle(
                  fontFamily: 'Metrolpolis',
                  fontSize: 13,
                  fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, top: 7, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 240,
                          child: Text(
                            "Size",
                            style: TextStyle(
                                fontSize: 17.8, fontFamily: 'Metrolpolis'),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.1,
                              blurRadius: 7,
                            )
                          ], borderRadius: BorderRadius.circular(20)),
                          child: FlutterToggleTab(
                            height: 40,
                            labels: lables,
                            width: 60,
                            selectedLabelIndex: (Index) {
                              setState(() {
                                counter = Index;
                              });
                            },
                            selectedBackgroundColors: [Colors.orange],
                            unSelectedBackgroundColors: [Colors.white],
                            selectedTextStyle: TextStyle(color: Colors.white),
                            unSelectedTextStyle: TextStyle(color: Colors.black),
                            selectedIndex: counter,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Add to Cart"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 12, fontFamily: 'Metrolpolis'),
                          backgroundColor: Colors.orange,
                          shadowColor: Color.fromARGB(255, 255, 158, 12),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Colors.orange))),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                width: 500,
                child: RichText(
                    text: TextSpan(
                        text: 'People also',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Metrolpolis'),
                        children: [
                      TextSpan(
                          text: ' buy',
                          style: TextStyle(
                              color: Colors.orange, fontFamily: 'Metrolpolis'))
                    ])),
              ),
            ),
            SizedBox(
              height: 150,
              width: 200,
              child: Card(
                elevation: 8,
                shadowColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                        color: Colors.orange, style: BorderStyle.none)),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 110,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/food.jpg",
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 87, left: 6),
                            child: Icon(
                              MyIcons.veg,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 4, right: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Chicken Pasta"),
                          Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.orange),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "4.0",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 14,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
