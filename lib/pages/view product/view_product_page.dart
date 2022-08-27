// ignore: unused_import
import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/widgets/view%20product/container_product.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class ViewProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerProductWithDelete(
                        imageProduct:
                            "assets/PVC Figure 1-7 Blaze - Arknights.png",
                        imagePreorder_Ready: "assets/Ready Stock.png",
                        nameProduct: "PVC Figure 1/7 Blaze - Arknights",
                        price: "IDR 2,850,000"),
                    ContainerProductWithDelete(
                        imageProduct:
                            "assets/PVC Figure 1-7 Ifrit - Arknights.png",
                        imagePreorder_Ready: "assets/Pre-Order.png",
                        nameProduct: "PVC Figure 1/7 Ifrit - Arknights",
                        price: "IDR 3,200,000"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerProductWithDelete(
                        imageProduct:
                            "assets/Nendoroid Lappland - Arknights.png",
                        imagePreorder_Ready: "assets/Pre-Order.png",
                        nameProduct: "Nendoroid Lappland - Arknights",
                        price: "IDR 880"),
                    ContainerProductWithDelete(
                        imageProduct:
                            "assets/PVC Figure 1-7 Texas Arknights.png",
                        imagePreorder_Ready: "assets/Pre-Order.png",
                        nameProduct: "PVC Figure 1/7 Texas Arknights",
                        price: "IDR 2,820,000"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerProductWithDelete(
                        imageProduct:
                            "assets/Figma Karyl - Princess Connect! ReDive.png",
                        imagePreorder_Ready: "assets/Pre-Order.png",
                        nameProduct: "Figma Karyl - Princess Connect! ReDive",
                        price: "IDR 1,140,000"),
                    ContainerProductWithDelete(
                        imageProduct:
                            "assets/Figma Mona Megistus - Genshin Impact.png",
                        imagePreorder_Ready: "assets/Pre-Order.png",
                        nameProduct: "Figma Mona Megistus - Genshin Impact",
                        price: "IDR 1,240,000"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
