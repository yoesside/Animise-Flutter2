// ignore: unused_import
import 'dart:convert';

import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/widgets/admin/order/container_order.dart';
import 'package:animise_application/widgets/admin/order/sizedbox_for_container_order.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../providers/state_notifier.dart';
import '../../../../services/admin/order_service.dart';

class OrderSendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var service = new OrderService(context);

    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      body: SingleChildScrollView(
        child: Consumer<Notifier>(
          builder: (context, provider, child) {
            return FutureBuilder(
                future: service.retrieveAllOrders(status: 'send'),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                  if (snapshot.connectionState == ConnectionState.done) {

                    var orders    = json.decode(snapshot.data.toString());
                    var formatter = NumberFormat('#,###,000');

                    List<Widget> widgets = List<Widget>.empty(growable: true);

                    orders['data'].forEach((order) {

                      order['products'].forEach((product) {

                        widgets.add(
                            ContainerOrder(
                                name: order['user']['name'],
                                imageProduct: product['product']['image_url'],
                                imagePreorder_Ready: product['product']['pre_order'] == 1 ? "assets/Ready Stock.png" : "assets/Pre-Order.png",
                                nameProduct: product['product']['name'],
                                price: "IDR " + formatter.format(product['product']['price']),
                                quantity: product['quantity'].toString()
                            )
                        );
                      });
                      widgets.add(SizedBoxedContainerOrder());
                    });

                    return Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        ...widgets
                      ],
                    );
                  }

                  return Text('wait a minute');
                }
            );
          },
        ),
      ),
    );
  }
}
