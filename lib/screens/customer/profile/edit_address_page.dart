import 'dart:convert';

import 'package:animise_application/providers/state_notifier.dart';
import 'package:animise_application/services/customer/profile_service.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditAddressPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextEditingController address = new TextEditingController();

    Widget buildAddress() => TextField(
      controller: address,
      decoration: InputDecoration(
        labelText: "Change Address",
        border: OutlineInputBorder(),
      ),
      
    );

    var service = new ProfileService(context);

    return Scaffold(
       appBar: AppBar(
        title: Text("Edit address"),
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

                address.text = profile['data']['user']['biodata']['address'];

                return Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      buildAddress(),
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
                            'address': address.text,
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