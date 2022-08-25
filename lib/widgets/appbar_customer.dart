// ignore: unused_import
import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppbarCustomer extends StatelessWidget {
  AppbarCustomer(Type homeCustomerPage);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryOrangeColor,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 0,
            top: 5,
            bottom: 5,
            right: 0,
          ),
          child: Row(
            children: [
              Flexible(
                  child: Container(
                width: 360,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 11,
                        bottom: 11,
                      ),
                      fillColor: Color(0xffFFFFFF),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Search",
                      hintStyle: GoogleFonts.montserrat(
                        color: primaryOrangeColor,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: primaryOrangeColor,
                      )),
                ),
              )),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (){
                   Navigator.pushNamed(context, '/shopping-cart');
                },
                child: Icon(Icons.shopping_cart))
            ],
          ),
        ),
      ),
    );
  }
}