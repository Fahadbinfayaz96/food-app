// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, prefer_final_fields, sort_child_properties_last, unused_local_variable

import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'icons.dart';

class customerCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => customerCartState();
}

class customerCartState extends State<customerCart> {
  var arrItems = [
    'Chicken Tikka ',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "Cart",
                    style: TextStyle(fontFamily: 'Metrolpolis', fontSize: 27),
                  ),
                ),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
                centerTitle: true,
                actions: [
                  SizedBox(
                    width: 170,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 150, top: 14),
                      child: Icon(
                        FontAwesomeIcons.cartShopping,
                      ),
                    ),
                  ),
                ])),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 545,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            icon: Icons.delete,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25)),
                            backgroundColor: Colors.red.withOpacity(0.3),
                            onPressed: ((context) => {}),
                          )
                        ]),
                        child: Container(
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25)),
                          child: Card(
                              elevation: 7,
                              shadowColor: Color.fromARGB(255, 255, 136, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: 130,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            bottomLeft: Radius.circular(25)),
                                        child: Image.asset(
                                          'assets/images/food.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              arrItems[index],
                                              style: TextStyle(
                                                  fontFamily: "Metrolpolis"),
                                            ),
                                            Icon(
                                              MyIcons.veg,
                                              color: Colors.red,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Prefrence: Less spicy with extra cheese",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 80,
                                          height: 30,
                                          child:
                                              NumberInputWithIncrementDecrement(
                                            controller: TextEditingController(),
                                            initialValue: 1,
                                            widgetContainerDecoration:
                                                BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  style: BorderStyle.none),
                                            ),
                                            style: TextStyle(
                                                fontFamily: 'Metrolpolis',
                                                fontSize: 17,
                                                color: Colors.white),
                                            numberFieldDecoration:
                                                InputDecoration(
                                              disabledBorder: InputBorder.none,
                                              isDense: true,
                                              enabled: false,
                                            ),
                                            incIconDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  style: BorderStyle.none),
                                            ),
                                            incIconColor: Colors.white,
                                            incIconSize: 17,
                                            decIconDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                            decIconColor: Colors.white,
                                            decIconSize: 17,
                                            separateIcons: true,
                                            buttonArrangement: ButtonArrangement
                                                .incRightDecLeft,
                                            incIcon: FontAwesomeIcons.plus,
                                            decIcon: FontAwesomeIcons.minus,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            "\$ 2",
                                            style: TextStyle(
                                                fontFamily: "Metrolpolis"),
                                          ),
                                        ),
                                        Divider(),
                                        Text(
                                          "T: \$2",
                                          style: TextStyle(
                                              fontFamily: "Metrolpolis",
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    );
                  },
                  itemCount: arrItems.length),
            ),
            Divider(
              height: 85.5,
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      spreadRadius: 3)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Item Total",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "Tax",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            Divider(),
                            Text(
                              "To Pay",
                              style: TextStyle(fontFamily: 'Metrolpolis'),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "\$7.00",
                            ),
                            Text(
                              "\$0.07",
                            ),
                            Divider(),
                            Text(
                              "\$7.07",
                            ),
                          ],
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Order Now "),
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
          ],
        ));
  }
}
