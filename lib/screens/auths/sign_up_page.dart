import 'package:animise_application/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../utils/routes/routes.dart';

class SignUpPage extends StatefulWidget {

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
	TextEditingController fullname = TextEditingController();

	TextEditingController username = TextEditingController();

	TextEditingController password = TextEditingController();

	TextEditingController phone    = TextEditingController();

	TextEditingController address  = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Widget fullnameInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fullname",
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
                      "assets/icon_fullname.png",
                      width: 23,
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
						controller: fullname,
                        decoration: InputDecoration.collapsed(
                            hintText: "Enter your fullname"),
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
                        style: primaryTextStyle,
                        controller: username,
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

    Widget phoneNumberInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Phone number",
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
                      "assets/icon_phonenumber.png",
                      width: 23,
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: TextFormField(
						  controller: phone,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                            hintText: "Enter your phone number"),
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

    Widget addressInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Address",
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
                      "assets/icon_address.png",
                      width: 23,
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
						            controller: address,
                        decoration: InputDecoration.collapsed(
                            hintText: "Enter your phone number"),
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

    Widget signUpButton() {
      return Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.only(top: 35),
        child: TextButton(
          onPressed: () async {
			  	var endpoint = (routeConfig['baseUrl'] as String) + '/' + (routeConfig['version'] as String) + (((routeConfig['endpoints'] as Map)['auth'] as Map)['register'] as String);

				Dio dio = new Dio();

				try {
					
					// username : rini66
					// password : 123456
       // ignore: unused_local_variable
			  		Response<Map> response;
					dynamic data = {
						'name': fullname.text,
						'username': username.text,
						'password': password.text,
						'phone': phone.text,
						'address': address.text,
					};
				  
					response = await dio.post(endpoint, data: data, options: Options(
						headers: {
							'Accept': 'application/json',
							'Content-Type': 'application/json'
						}
					));

					AlertDialog alert = AlertDialog(
						title: Text("Register"),
						content: Text("Register success"),
					);

					// show the dialog
					showDialog(
						context: context,
						builder: (BuildContext context) {
							return alert;
						},
					);
				} on DioError catch (e) {
					Response? response = e.response;
					String content = '';

					Widget okButton = TextButton(
						child: Text("OK"),
						onPressed: () {},
					);

					if (response?.data['errors']['name'] != null) {
					  	content = response?.data['errors']['name'][0];

					} else if (response?.data['errors']['username'] != null) {
					  	content = response?.data['errors']['username'][0];

					} else if (response?.data['errors']['password'] != null) {
					  	content = response?.data['errors']['password'][0];

					} else if (response?.data['errors']['phone'] != null) {
					  	content = response?.data['errors']['phone'][0];

					} else if (response?.data['errors']['address'] != null) {
					  	content = response?.data['errors']['address'][0];

					} else if (response?.data['errors']['user'] != null) {
						content = response?.data['errors']['user'];
						
					}

					AlertDialog alert = AlertDialog(
						title: Text("Validation error"),
						content: Text(content),
						actions: [
							okButton,
						],
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
		  },
          style: TextButton.styleFrom(
            backgroundColor: primaryYellowColor,
          ),
          child: Text(
            "Sign Up",
            style: thirdTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryOrangeColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(54, 20, 54, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 152,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Logo_Text.png"))),
                ),
              ),
              fullnameInput(),
              usernameInput(),
              passwordInput(),
              phoneNumberInput(),
              addressInput(),
              signUpButton(),
              Spacer(),
              
            ],
          ),
        ),
      ),
    );
  }
}
