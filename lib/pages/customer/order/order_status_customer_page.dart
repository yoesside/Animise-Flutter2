import 'package:animise_application/theme/theme.dart';
// ignore: unused_import
import 'package:animise_application/widgets/customer/order/container_orderstatus.dart';
import 'package:animise_application/widgets/customer/order/sizedbox_for_container_orderstatus.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class OrderStatusCustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Status"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: bodyBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerOrderStatus(
                imageProduct: "assets/PVC Figure 1-7 Blaze - Arknights.png",
                imagePreorder_Ready: "assets/Ready Stock.png",
                nameProduct: "PVC Figure 1/7 Blaze - Arknights",
                price: "IDR 2,850,000",
                quantity: "1",
                imageOrderStatus: "assets/Already Sent.png"),
            ContainerOrderStatus(
                imageProduct: "assets/PVC Figure 1-7 Ifrit - Arknights.png",
                imagePreorder_Ready: "assets/Pre-Order.png",
                nameProduct: "PVC Figure 1/7 Ifrit - Arknights",
                price: "IDR 3,200,000",
                quantity: "1",
                imageOrderStatus: "assets/Already Sent.png"),
            SizedboxForOrderStatus(),
            ContainerOrderStatus(
                imageProduct:
                    "assets/Figma Ruler Jeanne d'Arc - Fate Grand Order.png",
                imagePreorder_Ready: "assets/Ready Stock.png",
                nameProduct:
                    "Figma Ruler / Jeanne d'Arc - Fate/Grand Order .png",
                price: "IDR 1,200,000",
                quantity: "1",
                imageOrderStatus: "assets/Order Rejected.png"),
            SizedboxForOrderStatus(),
            
            
          ],
        ),
      ),
    );
  }
}
