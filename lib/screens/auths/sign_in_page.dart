// import 'dart:io';

import 'dart:convert';
import 'dart:io';

import 'package:animise_application/models/user_model.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/utils/helpers/routes/path_parameter.dart';
import 'package:animise_application/utils/helpers/routes/routes_generator.dart';
import 'package:animise_application/utils/net/api.dart';
import 'package:animise_application/utils/storage/storage.dart';
import 'package:animise_application/widgets/dialog/alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {

	TextEditingController username = TextEditingController();
	TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style:
                  secondaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: textWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon_username.png",
                      width: 23,
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: TextFormField(
						  controller: username,
                        autofocus: true,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                            hintText: "Enter your username"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style:
                  secondaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: textWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon_password.png",
                      width: 23,
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: TextFormField(
						  controller: password,
                        autofocus: true,
                        style: primaryTextStyle,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                            hintText: "Enter your password"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.only(top: 90),
        child: TextButton(
          onPressed: () async {

            var api = new Api();
            var generator = new RouteGenerator();
            
            generator.noVersion();
            generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['auth']['login']), new List<PathParameter>.empty());

            api.post(generator.getFullEndpointUrl(), data: {
              'username': username.text,
              'password': password.text,
            });

            api.onSuccess(onSuccess: (response) {

              dynamic decode = json.decode(response.toString());

              String role = decode['data']['role'];

              Storage.saveToken(decode['data']['token']);
              Storage.saveString('role', role);

              if (role == User.USER_ROLE_ADMIN) {
                Navigator.pushReplacementNamed(context, '/homescreen-admin');
              } else {
                Navigator.pushReplacementNamed(context, '/main-customer');
              }

            });

            api.onFailed(onFailed: (DioError error) {

              dynamic decode = json.decode(error.response.toString());

              int? statusCode = error.response?.statusCode;

              var text   = 'Something went wrong';
              var errors = decode['errors'];

              if (statusCode == HttpStatus.unprocessableEntity) {

                if (errors['username'] != null) {
                  text = errors['username'][0];
                } else if (errors['password'] != null) {
                  text = errors['password'][0];
                } else {
                  text = errors['user'][0];
                }

              } else if (statusCode == HttpStatus.notFound) {
                text = errors['user'][0];
              }

              fireAlert(context, Text(text), title: 'Validation error');
            });
		  },
          style: TextButton.styleFrom(
            backgroundColor: primaryYellowColor,
          ),
          child: Text(
            "Sign In",
            style: thirdTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don’t have an account?",
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: semibold)),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/sign-up');
                },
                child: Text(
                  " Sign Up",
                  style: fourthTextStyle.copyWith(
                      fontSize: 14, fontWeight: semibold),
                ),
              ),
            ],
          ));
    }


    return Scaffold(
      backgroundColor: primaryOrangeColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(54, 47, 54, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 210,
                  height: 175,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Logo_Animise.png"))),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Center(
                child: Container(
                  width: 152,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Logo_Text.png"))),
                ),
              ),
              usernameInput(),
              passwordInput(),
              signInButton(),
              Spacer(),
              footer(),
              
            ],
          ),
        ),
      ),
    );
  }
}
