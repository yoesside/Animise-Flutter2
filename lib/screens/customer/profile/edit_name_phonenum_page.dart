import 'dart:convert';

import 'package:animise_application/providers/state_notifier.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/customer/profile_service.dart';

class EditNamePhoneNum extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextEditingController name  = new TextEditingController();
    TextEditingController phone = new TextEditingController();

    Widget buildName() => TextField(
          controller: name,
          decoration: InputDecoration(
            labelText: "Change Full name",
            border: OutlineInputBorder(),
          ),
        );

    Widget buildPhoneNum() => TextField(
          controller: phone,
          decoration: InputDecoration(
            labelText: "Change Phone number",
            border: OutlineInputBorder(),
          ),
        );

    var service = new ProfileService(context);

    return Scaffold(
       appBar: AppBar(
        title: Text("Edit name & phone number"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<Notifier>(
        builder: (context, provider, child) {
          return FutureBuilder(
            future: service.retrieve(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

              if (snapshot.connectionState == ConnectionState.done) {

                var profile = json.decode(snapshot.data.toString());

                name.text  = profile['data']['user']['name'];
                phone.text = profile['data']['user']['biodata']['phone'];

                return Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      buildName(),
                      SizedBox(
                        height: 30,
                      ),
                      buildPhoneNum(),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        child: Text(
                          "Submit",
                          style: secondaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: primaryOrangeColor,
                        ),
                        onPressed: () {
                          dynamic map = {
                            'name': name.text,
                            'phone': phone.text,
                          };

                          service.update(FormData.fromMap(map));
                        },
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
