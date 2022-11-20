import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/widgets/customer/product/container_search_product.dart';
// ignore: unused_import
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/detail-page");
                      },
                      child: ContainerProduct(
                          imageProduct:"assets/PVC Figure 1-7 Blaze - Arknights.png",
                          imagePreorder_Ready: "assets/Ready Stock.png",
                          nameProduct: "PVC Figure 1/7 Blaze - Arknights",
                          price: "IDR 2,850,000"),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/detail-page");
                      },
                      child: ContainerProduct(
                          imageProduct:
                              "assets/PVC Figure 1-7 Ifrit - Arknights.png",
                          imagePreorder_Ready: "assets/Pre-Order.png",
                          nameProduct: "PVC Figure 1/7 Ifrit - Arknights",
                          price: "IDR 3,200,000"),
                    ), 
                  ],
                ),
                
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.pushNamed(context, "/detail-page");
                      }),
                      child: ContainerProduct(
                          imageProduct:"assets/PVC Figure 1-7 Texas Arknights.png",
                          imagePreorder_Ready: "assets/Pre-Order.png",
                          nameProduct: "PVC Figure 1/7 Texas Arknights",
                          price: "IDR 2,820,000"),
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.pushNamed(context, "/detail-page");
                      }),
                      child: ContainerProduct(
                          imageProduct:
                              "assets/Nendoroid Lappland - Arknights.png",
                          imagePreorder_Ready: "assets/Pre-Order.png",
                          nameProduct: "Nendoroid Lappland - Arknights",
                          price: "IDR 880,000"),
                    ), 
                  ],
                ),
              ],
            ),
          )),
        ));
  }
}
