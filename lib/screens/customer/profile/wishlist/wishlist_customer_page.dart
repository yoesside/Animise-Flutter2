// ignore: unused_import
import 'dart:convert';

import 'package:animise_application/theme/theme.dart';
// ignore: unused_import
import 'package:animise_application/widgets/customer/product/container_search_product.dart';
import 'package:flutter/material.dart';
import 'package:byte_flow/byte_flow.dart' as _;
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../services/customer/wishlist_service.dart';

class WishlistPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    WishlistService wishlistService = new WishlistService(context);

    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        title: Text("Wishlist"),
        backgroundColor: primaryOrangeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 17,
          top: 17,
          right: 17,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: wishlistService.retrieve(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                if (snapshot.connectionState == ConnectionState.done) {
                  var wishlists = json.decode(snapshot.data.toString());

                  var columns   = _.chunk(wishlists['data'], 2);

                  if (wishlists['data'].length == 0) {
                    return Text('no data');
                  }

                  List<Widget> widgets = new List<Widget>.empty(growable: true);
                  var formatter = NumberFormat('#,###,000');

                  columns.forEach((column) {

                    List<Widget> rows = List<Widget>.empty(growable: true);

                    column.forEach((row) {
                      rows.add(
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, "/detail-page", arguments: row['product']['id']);
                            },
                            child: ContainerProduct(
                              imageProduct: row['product']['image_url'],
                              imagePreorder_Ready: row['product']['pre_order'] == 1 ? "assets/Pre-Order.png" : "assets/Ready Stock.png",
                              nameProduct: row['product']['name'],
                              price: "IDR " + formatter.format(row['product']['price']),
                              id: row['product']['id'],
                            ),
                          )
                      );
                    });

                    widgets.add(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: rows,
                        )
                    );

                    widgets.add(SizedBox(
                      height: 15,
                    ));

                  });

                  return Column(
                    children: widgets,
                  );
                }

                return Text('wait a minute');
              },
            ),
          ),
        ),
      ),
    );
  }
}