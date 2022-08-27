import 'package:animise_application/theme/theme.dart';
// ignore: unused_import
import 'package:animise_application/widgets/view%20product/container_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DetailProductPage extends StatelessWidget {
  bool _isLikeButtonClicked = true;//change true or false

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        title: Text("Detail product"),
        backgroundColor: primaryOrangeColor,
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/PVC Figure 1-7 Ifrit - Arknights.png",
            width: 415,
            height: 415,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/Pre-Order.png",
                      width: 140,
                      height: 80,
                    ),
                    SizedBox(
                      width: 190
                    ),
                    Container(
                      child: IconButton(
                        icon: _isLikeButtonClicked
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_outline),
                        color: _isLikeButtonClicked ? Colors.red : Colors.black,
                        onPressed: (){

                          setState((){
                            _isLikeButtonClicked = !_isLikeButtonClicked;
                          });
                        }
                        ,),
                    ),
                  ],
                ),
                Text(
                  "PVC Figure 1/7 Ifrit - Arknights",
                  style: GoogleFonts.montserrat(
                    color: textBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "IDR 3,200,000",
                  style: GoogleFonts.montserrat(
                    color: primaryOrangeColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Releases January 2022",
                  style: GoogleFonts.montserrat(
                    color: textBlack,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Estimated Arrival February-March 2022",
                  style: GoogleFonts.montserrat(
                    color: textBlack,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 250),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Add to Cart",
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: primaryOrangeColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
