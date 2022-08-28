// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/theme.dart';

// ignore: must_be_immutable
class ProductList extends StatelessWidget {
  String imageProduct;
  String imagePreorder_Ready;
  String nameProduct;
  // String category;
  String price;
  // String realeses;
  // String estimated_arrival;

  ProductList(
      {required this.imageProduct,
      required this.imagePreorder_Ready,
      required this.nameProduct,
      // required this.category,
      required this.price,
      // required this.realeses,
      // required this.estimated_arrival
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 165,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imageProduct,
                  width: 90,
                  height: 90,
                ),
                SizedBox(
                  height: 5,
                ),
                Image.asset(
                  imagePreorder_Ready,
                  width: 68,
                  height: 13,
                ),
                SizedBox(height: 5),
                Text(
                  nameProduct,
                  style: GoogleFonts.montserrat(
                      color: textBlack,
                      fontSize: 8,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  price,
                  style: GoogleFonts.montserrat(
                      color: primaryOrangeColor,
                      fontSize: 9,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

