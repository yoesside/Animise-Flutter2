import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:animise_application/theme/theme.dart';

class DetailProductPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(title: Text("Detail product")),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 415,
              height: 415,
              decoration: BoxDecoration(color: primaryOrangeColor),
              child: Column(
                children: [
                  Image.asset(
                    "assets/PVC Figure 1-7 Texas Arknights.png",
                    width: 415,
                    height: 415,
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
