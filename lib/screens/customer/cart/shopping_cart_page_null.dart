import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartNull extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Shopping Cart"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 160,
            ),
            child: Center(
              child: Image.asset("assets/chibi_ganyu.png",
                width: 234,
                height: 218,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("There is no cart",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Text("data in the order",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text("If it already exists, it will appear here",
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.normal
            ),
          ),
           Text("Let’s order...",
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.normal
            ),
          ),
          
          
        ],
      ),
    );
  }
}