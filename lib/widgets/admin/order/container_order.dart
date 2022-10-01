// ignore: unused_import
import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ContainerOrder extends StatelessWidget {

  String name;
  String imageProduct;
  String imagePreorder_Ready;
  String nameProduct;
  // String category;
  String price;
  String quantity;
  // String realeses;
  // String estimated_arrival;
  ContainerOrder(
      {
      required this.name,
      required this.imageProduct,
      required this.imagePreorder_Ready,
      required this.nameProduct,
      // required this.category,
      required this.price,
      required this.quantity,
      // required this.realeses,
      // required this.estimated_arrival
      
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 180,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/profile_user.png",
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      name,
                      style: GoogleFonts.montserrat(
                        color: textBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/Transfer Photo.png",
                  width: 25,
                  height: 25,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageProduct,
                      width: 110,
                      height: 110,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameProduct,
                            style: GoogleFonts.montserrat(
                              color: textBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            price,
                            style: GoogleFonts.montserrat(
                              color: primaryOrangeColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset(
                            imagePreorder_Ready,
                            width: 60,
                            height: 18,
                          ),
                          SizedBox(
                                height: 35,
                              ),
                              Text(
                                "Quantity $quantity",
                                style: GoogleFonts.montserrat(fontSize: 13),
                              ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
