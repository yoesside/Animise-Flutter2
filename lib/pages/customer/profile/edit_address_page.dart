import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';

class EditAddressPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget buildAddress() => TextField(
      decoration: InputDecoration(
        labelText: "Change Address",
        border: OutlineInputBorder(),
      ),
      
    );

    return Scaffold(
       appBar: AppBar(
        title: Text("Edit address"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      body: Container(
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
                    onPressed: () {},
                  ),
          ],
        ),
      ),
    );
  }
}