import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ContainerShoppingCart extends StatelessWidget {
  String imageProduct;
  String imagePreorder_Ready;
  String nameProduct;
  // String category;
  String price;
 

  ContainerShoppingCart(
      {required this.imageProduct,
      required this.imagePreorder_Ready,
      required this.nameProduct,
      // required this.category,
      required this.price,
      
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
            left: 20,
            top: 20,
            right: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  imageProduct,
                  width: 110,
                  height: 110,
                ),
              ),
              Padding(
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
                        Image.asset("assets/minus_button.png",
                           width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("1",style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),),
                         SizedBox(
                          width: 20,
                        ),
                        Image.asset("assets/plus_button.png",
                           width: 20,
                          height: 20,
                        ),
                         SizedBox(
                          width: 20,
                        ),
                        Image.asset("assets/Delete.png",
                          width: 20,
                          height: 20,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    ));
  }
}