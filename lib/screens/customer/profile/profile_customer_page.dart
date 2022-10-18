import 'dart:convert';
import 'dart:io';

import 'package:animise_application/providers/state_notifier.dart';
import 'package:animise_application/services/customer/profile_service.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileCustomerPage extends StatefulWidget {
  @override
  _ProfileCustomerPageState createState() => _ProfileCustomerPageState();
}

class _ProfileCustomerPageState extends State<ProfileCustomerPage> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image!.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    ProfileService service = new ProfileService(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
        actions: [
          Stack(
            children: [
              IconButton(onPressed: () {
				Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
			  }, icon: Icon(Icons.exit_to_app))
            ],
          ),
        ],
      ),
      body: Consumer<Notifier>(
        builder: (context, provider, child) {
          return FutureBuilder(
            future: service.retrieve(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

              if (snapshot.connectionState == ConnectionState.done) {

                var profile = json.decode(snapshot.data.toString());

                Widget avatar() => profile['data']['user']['biodata']['avatar_url'] == null ? Image.asset(
                  "assets/profile_user.png",
                  width: 80,
                ) : Image.network(
                  profile['data']['user']['biodata']['avatar_url'],
                  width: 80,
                );

                return Container(
                  padding: EdgeInsets.fromLTRB(40, 40, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        ClipOval(
                          child: image != null
                              ? Image.file(
                            image!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                              : InkWell(
                            child: avatar(),
                            onTap: () {

                            },
                          ),
                        ),
                        SizedBox(
                          width: 23,
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            profile['data']['user']['name'],
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            profile['data']['user']['biodata']['phone'],
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            profile['data']['user']['username'],
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Account Information",
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit-name-phone');
                        },
                        child: Text(
                          "Edit name & phone number",
                          style: thirdTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: reguler,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/edit-password');
                          },
                          child: Text(
                            "Edit password",
                            style: thirdTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: reguler,
                            ),
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit-address');
                        },
                        child: Text(
                          "Edit address",
                          style: thirdTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: reguler,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/wishlist-page');
                        },
                        child: Text(
                          "Wishlist",
                          style: thirdTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: reguler,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Text('wait a minute');
            },
          );
        },
      ),
    );
  }
}
