import 'dart:convert';

import 'package:animise_application/theme/theme.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../services/customer/product_service.dart';

// ignore: must_be_immutable
class DetailProductPage extends StatelessWidget {
  bool _isLikeButtonClicked = true;//change true or false

  @override
  Widget build(BuildContext context) {

    var id      = ModalRoute.of(context)?.settings.arguments;
    var service = new ProductService(context);

    print(service.a(id.toString()));

    return Scaffold(
      backgroundColor: textWhite,
      appBar: AppBar(
        title: Text("Detail product"),
        backgroundColor: primaryOrangeColor,
      ),
      body: FutureBuilder(
        future: service.retrieve(id.toString()),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {

            var product   = json.decode(snapshot.data.toString());
            var formatter = NumberFormat('#,###,000');

            return Column(
              children: [
                Image.network(
                  product['data']['image_url'],
                  width: 390,
                  height: 380,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            product['data']['pre_order'] ? "assets/Pre-Order.png" : "assets/Ready Stock.png",
                            width: 140,
                            height: 80,
                          ),
                          SizedBox(
                              width: 170
                          ),
                          Container(
                            child: IconButton(
                              icon: _isLikeButtonClicked
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_outline),
                              color: _isLikeButtonClicked ? Colors.red : Colors.black,
                              onPressed: (){

                                setState((){
                                  _isLikeButtonClicked = !_isLikeButtonClicked;
                                });
                              }
                              ,),
                          ),
                        ],
                      ),
                      Text(
                        product['data']['name'],
                        style: GoogleFonts.montserrat(
                          color: textBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "IDR " + formatter.format(product['data']['price']),
                        style: GoogleFonts.montserrat(
                          color: primaryOrangeColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product['data']['release_date'] ?? '',
                        style: GoogleFonts.montserrat(
                          color: textBlack,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        product['data']['estimated_date'] ?? '',
                        style: GoogleFonts.montserrat(
                          color: textBlack,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 220),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Add to Cart",
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: primaryOrangeColor,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }

          return Text('wait a minute');
        },
      ),
    );
  }

  void setState(Null Function() param0) {}
}
