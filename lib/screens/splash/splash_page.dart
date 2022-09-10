// import 'dart:async';

import 'dart:async';

import 'package:animise_application/models/user_model.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/utils/storage/storage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override

  void initState() {

    // Storage.removeToken();

    Timer(Duration(seconds: 3), () {

      Storage.getString('role').then((role) {
        if (role == null) {
          Navigator.pushReplacementNamed(context, '/sign-in');
        } else if (role == User.USER_ROLE_ADMIN) {
          Navigator.pushReplacementNamed(context, '/homescreen-admin');
        } else {
          Navigator.pushReplacementNamed(context, '/main-customer');
        }
      });

    });

    // Timer(Duration(seconds: 3),()=> Navigator.pushNamed(context, '/sign-in'));

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
