// ignore: unused_import
import 'dart:convert';

import 'package:animise_application/providers/state_notifier.dart';
import 'package:animise_application/services/admin/product_service.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:byte_flow/byte_flow.dart' as _;
import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../widgets/customer/product/container_product.dart';

class ViewProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductService service = new ProductService(context);

    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        title: Text("View Product"),
        backgroundColor: primaryOrangeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          top: 20,
          right: 30,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<Notifier> (
              builder: (context, provider, child) {
                return FutureBuilder(
                  future: service.retrieveAllProduct(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {

                      var formatter = NumberFormat('#,##,000');
                      var products  = json.decode(snapshot.data.toString());
                      var columns   = _.chunk(products['data'], 2);

                      List<Widget> widgets = List<Widget>.empty(growable: true);

                      columns.forEach((column) {

                        List<Widget> rows = List<Widget>.empty(growable: true);

                        column.forEach((row) {

                          rows.add(
                              ContainerProductWithDelete(
                                imageProduct: row['image_url'],
                                imagePreorder_Ready: row['pre_order'] == 1 ? "assets/Ready Stock.png" : "assets/Pre-Order.png",
                                nameProduct: row['name'],
                                price: "IDR " + formatter.format(row['price']),
                                id: row['id'],
                              )
                          );
                        });

                        widgets.add(Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: rows,
                        ),
                        );

                        widgets.add(SizedBox(
                          height: 20,
                        ));
                      });

                      return Column(
                        children: widgets,
                      );
                    }

                    return Text('wait a minute');
                  },
                );
              },
            )
          ),
        ),
      ),
    );
  }
}
