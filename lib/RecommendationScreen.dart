// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_element, no_leading_underscores_for_local_identifiers, unnecessary_this, sized_box_for_whitespace, dead_code, prefer_adjacent_string_concatenation, void_checks, unnecessary_string_interpolations, empty_constructor_bodies, must_be_immutable, unused_label, unrelated_type_equality_checks

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_big_plate/CustomerCartScreen.dart';
import 'package:my_big_plate/DetailedProductScreen.dart';
import 'package:my_big_plate/Provider/Porducts.dart';
import 'package:my_big_plate/Provider/cart.dart';
import 'package:provider/provider.dart';
import 'icons.dart';

class recommondationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => recommondationPageState();
}

class recommondationPageState extends State<recommondationPage> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: !isSearching
              ? Text("Recommendation")
              : TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "search here",
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white)),
                ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            isSearching
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = !isSearching;
                      });
                    },
                    icon: Icon(Icons.cancel))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = !isSearching;
                      });
                    },
                    icon: Icon(Icons.search))
          ],
          centerTitle: true,
        ),
        body: recommendationList());
  }
}

class recommendationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => recommendationListState();
}

class recommendationListState extends State<recommendationList> {
  @override
  Widget build(BuildContext context) {
    final recomlist = Provider.of<products>(context, listen: false);
    final recomData = recomlist.items;
    final carrt = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => detailProduct(
                          recommendationModel: recomData[index],
                        )));
              }),
              child: Card(
                elevation: 6,
                shadowColor: Color.fromARGB(255, 233, 215, 51),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Container(
                  width: 370,
                  height: 130,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 226, 221, 221)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 130,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25)),
                            child: Image.network(
                              recomData[index].image.toString(),
                              fit: BoxFit.fill,
                            )), //images
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 150,
                              width: 180,
                              padding: EdgeInsets.only(
                                right: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, right: 60, bottom: 6),
                                    child: SizedBox(
                                        width: 50,
                                        height: 17,
                                        child: Image.asset(
                                            "assets/images/rating.png")),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 3, right: 4),
                                        child: Text(
                                          recomData[index]
                                              .ProductName
                                              .toString(), //items
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 7,
                                        child: Icon(
                                          MyIcons.veg,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          recomData[index]
                                              .description
                                              .toString(), //Description
                                          style: TextStyle(fontSize: 11),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: SizedBox(
                                    width: 160,
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          size: 15,
                                        ),
                                        Text(
                                          "${recomData[index].time.toString()} min", // time
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18),
                                          child: Text(
                                            "Rating : ",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        Text(
                                          recomData[index]
                                              .rating
                                              .toString(), //rating
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 15,
                                          color:
                                              Color.fromARGB(255, 255, 230, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 35, bottom: 19.0),
                                          child: Text(
                                            "\$" +
                                                " " +
                                                recomData[index]
                                                    .rate
                                                    .toString(), //Price
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                              top: 9,
                                            ),
                                            child: Card(
                                              elevation: 8,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              shadowColor: Color.fromARGB(
                                                  255, 255, 115, 0),
                                              child: InkWell(
                                                onTap: () {
                                                  carrt.addItem(
                                                    CartItem(
                                                        id: recomData[index].id,
                                                        title: recomData[index]
                                                            .ProductName,
                                                        image: recomData[index]
                                                            .image,
                                                        price: recomData[index]
                                                            .rate,
                                                        quantity: 1,
                                                        tax: 0.12,
                                                        initail: 1),
                                                  );
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 85,
                                                  decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    border: Border.all(
                                                        color: Colors.orange),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 7, top: 6),
                                                    child: Text(
                                                      "Add to Cart",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: recomData.length,
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: 0,
        backgroundColor: Colors.orange,
        selectedBackgroundColor: Colors.orange,
        items: [
          FloatingNavbarItem(
            customWidget: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => customerCart()));
              },
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Veiw Cart',
                          style: TextStyle(fontSize: 17),
                        ),
                        Icon(
                          FontAwesomeIcons.cartShopping,
                          size: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          FloatingNavbarItem(
            customWidget: Consumer<Cart>(
              builder: (BuildContext context, value, Widget? ch) => Text(
                value.itemCount.toString(),
              ),
            ),
          ),
        ],
        // onTap: (int val) {},
      ),
    );
  }
}
