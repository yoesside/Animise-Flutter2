// ignore: unused_import
import 'package:animise_application/theme/theme.dart';
// ignore: unused_import
import 'package:animise_application/widgets/customer/product/container_search_product.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class WishlistPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        title: Text("Wishlist"),
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerProduct(
                        imageProduct: "assets/PVC Figure 1-7 Blaze - Arknights.png",
                        imagePreorder_Ready: "assets/Ready Stock.png",
                        nameProduct: "PVC Figure 1/7 Blaze - Arknights",
                        price: "IDR 2,850,000"),
                    ContainerProduct(
                        imageProduct: "assets/PVC Figure 1-7 Ifrit - Arknights.png",
                        imagePreorder_Ready: "assets/Pre-Order.png",
                        nameProduct: "PVC Figure 1/7 Ifrit - Arknights",
                        price: "IDR 3,200,000"),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}