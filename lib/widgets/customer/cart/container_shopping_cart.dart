import 'dart:convert';

import 'package:animise_application/screens/customer/cart/shopping_cart_page.dart';
import 'package:animise_application/services/customer/cart_service.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerShoppingCart extends StatefulWidget {

  String imageProduct;
  String imagePreorder_Ready;
  String nameProduct;
  // String category;
  String price;
  String id;

  String cart_id;

  int quantity;

  ContainerShoppingCart(this.cart_id, this.id, this.quantity, {
    required this.imageProduct,
    required this.imagePreorder_Ready,
    required this.nameProduct,
    // required this.category,
    required this.price,
  });

  @override
  State<StatefulWidget> createState() => _ContainerShoppingCart();
}

// ignore: must_be_immutable
class _ContainerShoppingCart extends State<ContainerShoppingCart> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 410,
        height: 150,
         decoration: BoxDecoration(color: Color(0xffFFFFFF)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  widget.imageProduct,
                  width: 110,
                  height: 110,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nameProduct,
                        maxLines: 2,
                        style: GoogleFonts.montserrat(
                          color: textBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.price,
                        style: GoogleFonts.montserrat(
                          color: primaryOrangeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        widget.imagePreorder_Ready,
                        width: 70,
                        height: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Image.asset("assets/minus_button.png",
                              width: 20,
                              height: 20,
                            ),
                            onTap: () {
                              setState(() {
                                --widget.quantity;
              
                                var service = new CartService(context);
                                service.store(widget.id, quantity: widget.quantity, withAlert: false, onSuccess: () {
                                  reloadPage();
                                });
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(widget.quantity.toString(), style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),),
                           SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: Image.asset("assets/plus_button.png",
                              width: 20,
                              height: 20,
                            ),
                            onTap: () {
                              setState(() {
                                ++widget.quantity;
              
                                var service = new CartService(context);
                                service.store(widget.id, quantity: widget.quantity, withAlert: false, onSuccess: () {
                                  reloadPage();
                                });
                              });
                            },
                          ),
                           SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: Image.asset("assets/Delete.png",
                              width: 20,
                              height: 20,
                            ),
                            onTap: () {
                              var service = new CartService(context);
              
                              service.delete(widget.cart_id).then((value) {
                                reloadPage();
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    ));
  }

  void reloadPage() {
    var service = new CartService(context);

    service.retrieve().then((value) {
      var carts = json.decode(value.toString());
      var t = 0;

      carts['data'].forEach((cart) {
        t += (cart['product']['price'] as int) * (cart['quantity'] as int);
      });

      Navigator.pop(context);
      if (carts['data'].length == 0) {
        Navigator.pushNamed(context, '/shopping-cartnull');
      } else {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ShoppingCartPage(total: t,);
          },
          transitionDuration: Duration(seconds: 0),
        ));
      }
    });
  }
}