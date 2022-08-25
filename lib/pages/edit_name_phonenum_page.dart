import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';

class EditNamePhoneNum extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget buildName() => TextField(
          decoration: InputDecoration(
            labelText: "Change Full name",
            border: OutlineInputBorder(),
          ),
        );

    Widget buildPhoneNum() => TextField(
          decoration: InputDecoration(
            labelText: "Change Phone number",
            border: OutlineInputBorder(),
          ),
        );

    return Scaffold(
       appBar: AppBar(
        title: Text("Edit name & phone number"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      body: Container(
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
