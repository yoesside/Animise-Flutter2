import 'dart:convert';

import 'package:animise_application/services/customer/order_service.dart';
import 'package:animise_application/theme/theme.dart';
// ignore: unused_import
import 'package:animise_application/widgets/customer/order/container_orderstatus.dart';
import 'package:animise_application/widgets/customer/order/sizedbox_for_container_orderstatus.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OrderStatusCustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var service = new OrderService(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Order Status"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: bodyBackgroundColor,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: service.retrieve(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            if (snapshot.connectionState == ConnectionState.done) {

              var orders = json.decode(snapshot.data.toString());

              List<Widget> widgets = List<Widget>.empty(growable: true);

              var formatter = NumberFormat('#,###,000');

              orders['data'].forEach((order) {
                order['product_orders'].forEach((productOrder) {

                  var image = "assets/Already Sent.png";

                  if (order['status'] == "process") {
                    image = "assets/Process.png";
                  } else if (order['status'] == "pending") {
                    image = "assets/Process.png";
                  } else if (order['status'] == "rejected") {
                    image = "assets/Order Rejected.png";
                  }

                  widgets.add(
                      ContainerOrderStatus(
                          imageProduct: productOrder['product']['image_url'],
                          imagePreorder_Ready: productOrder['product']['pre_order'] == 1 ? "assets/Ready Stock.png" : "assets/Pre-Order.png",
                          nameProduct: productOrder['product']['name'],
                          price: "IDR " + formatter.format(productOrder['product']['price']),
                          quantity: productOrder['quantity'].toString(),
                          imageOrderStatus: image,
                      )
                  );
                });

                widgets.add(SizedboxForOrderStatus());
              });


              return Column(
                children: widgets,
              );

            }

            return Text('wait a minute');
          },
        ),
      ),
    );
  }
}
