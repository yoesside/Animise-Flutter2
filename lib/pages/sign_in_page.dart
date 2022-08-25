// import 'dart:io';

import 'package:animise_application/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:animise_application/config/routes.dart';

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

				var endpoint = (api['baseUrl'] as String) + '/' + (api['version'] as String) + (((api['endpoints'] as Map)['auth'] as Map)['login'] as String);

				Dio dio = new Dio();

				try {
					
					// username : rini66
					// password : 123456
			  		Response<Map> response;
					dynamic data = {
						'username': username.text,
						'password': password.text,
					};
				  
					response = await dio.post(endpoint, data: data, options: Options(
						headers: {
							'Accept': 'application/json',
							'Content-Type': 'application/json'
						}
					));

					if (response.data?['data']['role'] == 'admin') {
						Navigator.pushNamedAndRemoveUntil(context, '/homescreen-admin', (route) => false);
					} else {
						Navigator.pushNamedAndRemoveUntil(context, '/main-customer', (route) => false);
					}

          

					// AlertDialog alert = AlertDialog(
					// 	title: Text("Login"),
					// 	content: Text("Login success"),
					// );

					// // show the dialog
					// showDialog(
					// 	context: context,
					// 	builder: (BuildContext context) {
					// 		return alert;
					// 	},
					// );
				} on DioError catch (e) {
					Response? response = e.response;
					String content = '';

					if (response?.data['errors']['username'] != null) {
					  	content = response?.data['errors']['username'][0];
					} else if (response?.data['errors']['password'] != null) {
					  	content = response?.data['errors']['password'][0];
					} else {
						content = response?.data['errors']['user'][0];
					}
          print(response);

					AlertDialog alert = AlertDialog(
						title: Text("Validation error"),
						content: Text(content),
					);

					// show the dialog
					showDialog(
						context: context,
						builder: (BuildContext context) {
							return alert;
						},
					);

					// print((e.response?.data as Map)['errors']);
				}

				// print(api.endpoints?.auth);
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
