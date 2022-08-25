// import 'dart:async';

import 'dart:async';

import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override

  void initState() {

    Timer(Duration(seconds: 3),()=> Navigator.pushNamed(context, '/sign-in'));

    super.initState();
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryOrangeColor,
        body: Center(
          child: Container(
            width: 250,
            height: 195,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/Logo_Splash.png")),
            ),
          ),
        ));
  }
}
