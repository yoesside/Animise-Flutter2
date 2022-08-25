// ignore: unused_import
import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BannerList extends StatelessWidget {
  String imageBanner;

  BannerList({required this.imageBanner});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 115,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              top: 10,
            ),
            child: Image.asset(
              imageBanner,
              width: 148,
              height: 84,
            ),
          ),
          SizedBox(
            width: 200,
          ),
          InkWell(onTap: () {}, child: Image.asset("assets/Delete.png"))
        ],
      ),
    );
  }
}
