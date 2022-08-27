import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';

class EditPasswordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget buildPassword() => TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "New Password",
        border: OutlineInputBorder(),
      ),
      
    );

    return Scaffold(
       appBar: AppBar(
        title: Text("Edit password"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            buildPassword(),
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
