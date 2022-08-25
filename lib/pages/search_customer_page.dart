import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/widgets/container_search_product.dart';
// ignore: unused_import
import 'package:animise_application/widgets/container_product_with_delete.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class SearchCustomerPage extends StatefulWidget {
  @override
  State<SearchCustomerPage> createState() => _SearchCustomerPageState();
}

class _SearchCustomerPageState extends State<SearchCustomerPage> {
  @override
  Widget build(BuildContext context) {
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
                  width: 210,
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
                        imageProduct:"assets/PVC Figure 1-7 Blaze - Arknights.png",
                        imagePreorder_Ready: "assets/Ready Stock.png",
                        nameProduct: "PVC Figure 1/7 Blaze - Arknights",
                        price: "IDR 2,850,000"),
                    ContainerProduct(
                        imageProduct:
                            "assets/PVC Figure 1-7 Ifrit - Arknights.png",
                        imagePreorder_Ready: "assets/Pre-Order.png",
                        nameProduct: "PVC Figure 1/7 Ifrit - Arknights",
                        price: "IDR 3,200,000"), 
                  ],
                ),
                
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerProduct(
                        imageProduct:"assets/PVC Figure 1-7 Texas Arknights.png",
                        imagePreorder_Ready: "assets/Pre-Order.png",
                        nameProduct: "PVC Figure 1/7 Texas Arknights",
                        price: "IDR 2,820,000"),
                    ContainerProduct(
                        imageProduct:
                            "assets/Nendoroid Lappland - Arknights.png",
                        imagePreorder_Ready: "assets/Pre-Order.png",
                        nameProduct: "Nendoroid Lappland - Arknights",
                        price: "IDR 880,000"), 
                  ],
                ),
              ],
            ),
          )),
        ));
  }
}
