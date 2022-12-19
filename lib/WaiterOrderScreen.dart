// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderSummaryState();
}

class OrderSummaryState extends State<OrderSummary> {
  var orderNumber = ["1", "2", "3", "4", "5", "6"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "Order Summary ",
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
          )),
      body: ListView.builder(
        itemCount: orderNumber.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 120,
              child: Card(
                elevation: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Order No ${orderNumber[index]}",
                            style: TextStyle(
                                fontFamily: 'Metrolpolis', fontSize: 16),
                          ),
                          Text("Table No 4",
                              style: TextStyle(
                                  fontFamily: 'Metrolpolis', fontSize: 10))
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Order Now "),
                      style: ElevatedButton.styleFrom(
                        textStyle:
                            TextStyle(fontSize: 12, fontFamily: 'Metrolpolis'),
                        backgroundColor: Colors.orange,
                        shadowColor: Color.fromARGB(255, 255, 158, 12),
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
