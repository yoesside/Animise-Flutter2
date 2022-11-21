import 'dart:convert';

import 'package:animise_application/services/customer/search_product_service.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/widgets/customer/product/container_search_product.dart';
import 'package:byte_flow/byte_flow.dart' as _;
// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SearchCustomerPage extends StatefulWidget {
  @override
  State<SearchCustomerPage> createState() => _SearchCustomerPageState();
}

class _SearchCustomerPageState extends State<SearchCustomerPage> {
  @override
  Widget build(BuildContext context) {

    var category = ModalRoute.of(context)?.settings.arguments;
    var service  = new SearchProductService(context);

    return Scaffold(
        backgroundColor: bodyBackgroundColor,
        appBar: AppBar(
            backgroundColor: primaryOrangeColor,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Text(
                  "Search Product",
                ),
                SizedBox(
                  width: 190,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/shopping-cartnull');
                    },
                    child: Icon(Icons.shopping_cart))
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 17,
            top: 17,
            right: 17,
          ),
          child: SafeArea(
              child: SingleChildScrollView(
            child: FutureBuilder(
                future: service.retrieve(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                  if (snapshot.connectionState == ConnectionState.done) {

                    var formatter = NumberFormat('#,###,000');
                    var products  = json.decode(snapshot.data.toString());
                    var columns   = _.chunk(products['data'], 2);

                    List<Widget> widgets = List<Widget>.empty(growable: true);

                    columns.forEach((column) {

                      List<Widget> rows = List<Widget>.empty(growable: true);

                      column.forEach((row) {
                        rows.add(
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "/detail-page", arguments: row['id']);
                              },
                              child: ContainerProduct(
                                  imageProduct: row['image_url'],
                                  imagePreorder_Ready: row['pre_order'] == 1 ? "assets/Ready Stock.png" : "assets/Pre-Order.png",
                                  nameProduct: row['name'],
                                  price: "IDR " + formatter.format(row['price']),
                                  id: row['id'],
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
                }
            ),
          )),
        ));
  }
}
