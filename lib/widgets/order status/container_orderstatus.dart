import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ContainerOrderStatus extends StatelessWidget {
  String imageProduct;
  String imagePreorder_Ready;
  String nameProduct;
  // String category;
  String price;
  String quantity;
  // String realeses;
  // String estimated_arrival;
  String imageOrderStatus;

  ContainerOrderStatus(
      {required this.imageProduct,
      required this.imagePreorder_Ready,
      required this.nameProduct,
      // required this.category,
      required this.price,
      required this.quantity,
      // required this.realeses,
      // required this.estimated_arrival
      required this.imageOrderStatus,
      });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 410,
        height: 150,
        decoration: BoxDecoration(color: Color(0xffFFFFFF)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 10,
            right: 15,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imageProduct,
                  width: 110,
                  height: 110,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameProduct,
                        maxLines: 2,
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
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        "assets/Ready Stock.png",
                        width: 70,
                        height: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Quantity $quantity" ,
                            style: GoogleFonts.montserrat(fontSize: 13),
                          ),
                          SizedBox(
                            width: 102,
                          ),
                          Image.asset(
                            imageOrderStatus,
                            width: 62,
                            height: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
