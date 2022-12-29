import 'dart:collection';
import 'dart:convert';

import 'package:animise_application/services/customer/cart_service.dart';
import 'package:animise_application/services/customer/wishlist_service.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/utils/routes/routes.dart';
import 'package:animise_application/widgets/customer/home/container_product_home_mini.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../services/customer/banner_service.dart';

import '../../../widgets/customer/product/container_search_product.dart';

class HomeCustomerPage extends StatefulWidget {
  @override
  _HomeCustomerPageState createState() => _HomeCustomerPageState();
}

class _HomeCustomerPageState extends State<HomeCustomerPage> {

  TextEditingController search = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    BannerService bannerService = new BannerService(context);
    WishlistService wishlistService = new WishlistService(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryOrangeColor,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 0,
            top: 5,
            bottom: 5,
            right: 0,
          ),
          child: Row(
            children: [
              Flexible(
                  child: Container(
                width: 360,
                height: 40,
                child: TextFormField(
                  controller: search,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 11,
                        bottom: 11,
                      ),
                      fillColor: Color(0xffFFFFFF),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Search",
                      hintStyle: GoogleFonts.montserrat(
                        color: primaryOrangeColor,
                      ),
                      prefixIcon: InkWell(
                        child: Icon(
                          Icons.search,
                          color: primaryOrangeColor,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page', arguments: {
                            'name': search.text
                          });
                        },
                      )),
                ),
              )),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (){
                  var cartService = new CartService(context);

                  cartService.retrieve().then((value) {

                    var carts = json.decode(value.toString());
                    var total = 0;

                    carts['data'].forEach((cart) {
                      total += (cart['product']['price'] as int) * (cart['quantity'] as int);
                    });

                    if (carts['data'].length == 0) {
                      Navigator.pushNamed(context, '/shopping-cartnull');
                    } else {
                      Navigator.pushNamed(context, '/shopping-cart', arguments: {
                        'total': total,
                      });
                    }
                  });

                },
                child: Icon(Icons.shopping_cart))
            ],
          ),
        ),
      ),
      backgroundColor: bodyBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          // right: 20,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FutureBuilder(
                    future: bannerService.retrieve(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                      if (snapshot.connectionState == ConnectionState.done) {

                        var banners = json.decode(snapshot.data.toString());

                        List<Widget> widgets = List<Widget>.empty(growable: true);

                        banners['data'].forEach((banner) {
                          widgets.add(
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  banner['image'],
                                  width: 360,
                                  height: 200,
                                ),
                              ),
                            )
                          );

                          widgets.add(
                            SizedBox(
                              width: 10,
                            )
                          );
                        });

                        return Row(
                          children: widgets,
                        );
                      }

                      return Text('wait a minute');
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Categories",
                  style: GoogleFonts.montserrat(
                      color: textBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    // left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page', arguments: 1);
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/pvc_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "PVC Figure",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page', arguments: 2);
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/nendoroid_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Nendoroid",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page', arguments: 3);
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/figma_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Figma",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page', arguments: 4);
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/gundam_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Model Kit",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    // left: 20,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page', arguments: 5);
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/cd_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "CDs",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page', arguments: 6);
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/manga_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Manga",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page', arguments: 7);
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/lightnovel_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Light Novel",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page', arguments: 8);
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/merchandise_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Merchandise",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Most liked",
                  style: GoogleFonts.montserrat(
                      color: textBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: FutureBuilder(
                    future: wishlistService.retrieve(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                      if (snapshot.connectionState == ConnectionState.done) {

                        var wishlists = json.decode(snapshot.data.toString());

                        if (wishlists['data'].length == 0) {
                          return Text('no data');
                        }

                        List<Widget> widgets = new List<Widget>.empty(growable: true);
                        var formatter = NumberFormat('#,###,000');

                        wishlists['data'].forEach((wishlist) {
                            widgets.add(
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/detail-page", arguments: wishlist['product']['id']);
                                  },
                                  child: ContainerProduct(
                                    imageProduct: wishlist['product']['image_url'],
                                    imagePreorder_Ready: wishlist['product']['pre_order'] == 0 ? "assets/Pre-Order.png" : "assets/Ready Stock.png",
                                    nameProduct: wishlist['product']['name'],
                                    price: "IDR " + formatter.format(wishlist['product']['price']),
                                    id: wishlist['product']['id'],
                                  ),
                                )
                            );
                        });

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: widgets,
                        );
                      }

                      return Text('wait a minute');
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
