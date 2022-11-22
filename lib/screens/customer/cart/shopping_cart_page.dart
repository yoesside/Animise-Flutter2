import 'dart:collection';
import 'dart:convert';

import 'package:animise_application/services/customer/cart_service.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:byte_flow/byte_flow.dart' as _;
// ignore: unused_import
import 'package:animise_application/widgets/customer/cart/container_shopping_cart.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShoppingCartPage extends StatefulWidget {

  int total;

  ShoppingCartPage({this.total = 0});

  @override
  State<StatefulWidget> createState() => _ShoppingCartPage();
}

class _ShoppingCartPage extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {

    var service = new CartService(context);
    var formatter = NumberFormat('#,###,000');

    var total = widget.total;

    if (ModalRoute.of(context)?.settings.arguments != null) {

      var arguments = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

      total = arguments['total'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder(
          future: service.retrieve(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            if (snapshot.connectionState == ConnectionState.done) {

              var carts = json.decode(snapshot.data.toString());

              List<Widget> widgets = List<Widget>.empty(growable: true);

              carts['data'].forEach((cart) {
                widgets.add(
                    ContainerShoppingCart(
                      cart['id'].toString(), cart['product']['id'].toString(), cart['quantity'],
                      imageProduct: cart['product']['image_url'],
                      imagePreorder_Ready: cart['product']['pre_order'] == 1 ? "assets/Ready Stock.png" : "assets/Pre-Order.png",
                      nameProduct: cart['product']['name'],
                      price: "IDR " + formatter.format(cart['product']['price']),
                    )
                );
              });

              return Column(
                children: widgets,
              );
            }

            return Text('');
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Text("Total Price \n IDR " + formatter.format(total),
            style: GoogleFonts.montserrat(
              color: primaryOrangeColor,
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),
          ),
          label: ""
          ),
           BottomNavigationBarItem(icon: Container(
            width: 153,
            height: 47,
             child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryOrangeColor
              ),
                onPressed: (){
                  Navigator.pushNamed(context, '/payment-page');
                }, 
                child: Text(
                  "Checkout",
                  style: GoogleFonts.montserrat(
                    color: textWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                )),
           ),
              label: "",

          
          ),
      ],),
    );
  }
}
