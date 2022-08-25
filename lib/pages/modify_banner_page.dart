// ignore: unused_import
import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/widgets/banner_list.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class ModifyBannerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
       appBar: AppBar(
        title: Text("Modify Banner"),
        backgroundColor: primaryOrangeColor,
      ),body: Column(
        children: [
         BannerList(imageBanner: 'assets/Banner_1.png',),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){},
            backgroundColor: primaryOrangeColor,
          )],
          )
          
          
        ],
      ),
    );
  }
}