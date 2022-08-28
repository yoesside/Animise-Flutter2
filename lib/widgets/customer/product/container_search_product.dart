import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/theme.dart';

// ignore: must_be_immutable
class ContainerProduct extends StatelessWidget {
  String imageProduct;
  String imagePreorder_Ready;
  String nameProduct;
  // String category;
  String price;
  // String realeses;
  // String estimated_arrival;

  ContainerProduct({
      required this.imageProduct,
      required this.imagePreorder_Ready,
      required this.nameProduct,
      // required this.category,
      required this.price,
      // required this.realeses,
      // required this.estimated_arrival
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 240,
      decoration: BoxDecoration(
          color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 5,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageProduct,
              width: 140,
              height: 140,
            ),
            SizedBox(
              height: 5,
            ),
            Image.asset(
              imagePreorder_Ready,
              width: 74,
              height: 14,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
             nameProduct,
              style: GoogleFonts.montserrat(
                  color: textBlack, fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: GoogleFonts.montserrat(
                  color: primaryOrangeColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            
          ],
        ),
      ),
    );
  }
}