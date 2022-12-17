// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, prefer_final_fields, sort_child_properties_last, unused_local_variable

import 'dart:core';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'Provider/cart.dart';
import 'icons.dart';

class customerCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => customerCartState();
}

class customerCartState extends State<customerCart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    log(cartProvider.itemCount.toString());
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
        children: [
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    cartItem: cartProvider.items[index],
                    index: index,
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300, blurRadius: 4, spreadRadius: 3)
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
                            "\$ ${cartProvider.totalamout}",
                          ),
                          Text(
                            "\$ ${cartProvider.itemTax.roundToDouble()}",
                          ),
                          Divider(),
                          Text(
                            "\$${cartProvider.toPay}",
                          ),
                        ],
                      )
                    ],
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
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  CartItemWidget({
    Key? key,
    required this.cartItem,
    required this.index,
  }) : super(key: key);

  CartItem cartItem;
  int index;

  @override
  Widget build(BuildContext context) {
    final removeItem = Provider.of<Cart>(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            icon: Icons.delete,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            backgroundColor: Colors.red.withOpacity(0.3),
            onPressed: ((context) => {removeItem.removeItem(cartItem)}),
          )
        ]),
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Card(
            elevation: 7,
            shadowColor: Color.fromARGB(255, 255, 136, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    child: Image.network(
                      cartItem.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            cartItem.title,
                            style: TextStyle(fontFamily: "Metrolpolis"),
                          ),
                          SizedBox(
                            width: 10,
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
                      ProductQuantity(
                        cartItem: cartItem,
                        index: index,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "\$${cartItem.price}",
                          style: TextStyle(fontFamily: "Metrolpolis"),
                        ),
                      ),
                      Text(
                        "T: \$ ${removeItem.totalSelectedQuantityPrice}",
                        style:
                            TextStyle(fontFamily: "Metrolpolis", fontSize: 14),
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
  }
}

class ProductQuantity extends StatefulWidget {
  const ProductQuantity({
    Key? key,
    required this.cartItem,
    required this.index,
  }) : super(key: key);

  final CartItem cartItem;
  final int index;

  @override
  State<ProductQuantity> createState() => _ProductQuantityState();
}

class _ProductQuantityState extends State<ProductQuantity> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              if (cartProvider.items[widget.index].quantity > 0) {
                cartProvider.decreaseQuantity(widget.cartItem);
              }
            },
            child: Icon(
              FontAwesomeIcons.minus,
              color: Colors.white,
              size: 15,
            ),
          ),
          Text(
            cartProvider.items[widget.index].quantity.toStringAsFixed(0),
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              cartProvider.increaseQuantity(widget.cartItem);
            },
            child: Icon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
