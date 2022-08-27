// ignore: unused_import
import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class ContainerSendButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 300,
        ),
        child: Row(
          children: [
            InkWell(
              onTap: (){

              },
              child: Image.asset("assets/Send.png",
                width: 52,
                height: 25,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}