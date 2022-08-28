// ignore: unused_import
import 'package:animise_application/screens/admin/order/tab/order_in_page.dart';
import 'package:animise_application/screens/admin/order/tab/order_process_page.dart';
import 'package:animise_application/screens/admin/order/tab/order_reject_page.dart';
import 'package:animise_application/screens/admin/order/tab/order_send_page.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class OrderListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4, child: Scaffold(
          appBar: AppBar(
            title: Text("Order List"),
            backgroundColor: primaryOrangeColor,
            bottom: TabBar(tabs: [
              Tab(text: "Order \nIn",),
              Tab(text: "Order \nProcess",),
              Tab(text: "Order \nSend",),
              Tab(text: "Order \nReject",),
            ],),
          ),
          body: TabBarView(children: [
            OrderInPage(),
            OrderProcessPage(),
            OrderSendPage(),
            OrderRejectPage(),
          ]),
        ),
      )
      
    );
  }
}
