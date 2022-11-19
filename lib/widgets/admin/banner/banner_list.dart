// ignore: unused_import
import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/state_notifier.dart';

// ignore: must_be_immutable
class BannerList extends StatelessWidget {
  String imageBanner;

  int id;

  BannerList({required this.imageBanner, required this.id});

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
            child: Image.network(
              imageBanner,
              width: 148,
              height: 84,
            ),
          ),
          SizedBox(
            width: 170,
          ),
          InkWell(onTap: () {
            Provider.of<Notifier>(context, listen: false).deleteBannerById(context, id);
          }, child: Image.asset("assets/Delete.png"))
        ],
      ),
    );
  }
}
