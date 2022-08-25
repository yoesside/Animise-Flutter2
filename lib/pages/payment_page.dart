import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Image.asset(
                  "assets/chibi_eula.png",
                  width: 203,
                  height: 199,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "1. Transfer via Bank BCA to number 7670559267",
            ),
            SizedBox(
              height: 5,
            ),
            Text("2. After making the transfer, Animise will verify it in"),
            SizedBox(
              height: 5,
            ),
            Text("     a few minutes"),
            SizedBox(
              height: 5,
            ),
            Text("3. Payments made at 00.00 - 09.00 will be verified"),
            SizedBox(
              height: 5,
            ),
            Text("     at 10.00"),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transfer payment",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                TextButton(onPressed: (){}, 
                  child: Text("Add Photo",style: GoogleFonts.montserrat(
                    color: Color(0xffFF5C00),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )
                  ),
                )
              ],
            ),
            Container(//Untuk masang foto bukti pembayaran
              width: 102,
              height: 115,
            ),
            
            Center(//Bantu buatin tombol take a picture
              child: ElevatedButton(
                      child: Text(
                        "Upload Image",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: primaryOrangeColor,
                      ),
                      onPressed: () {},
                    ),
            ),
          ],

        ),
      ),
    );
  }
}
