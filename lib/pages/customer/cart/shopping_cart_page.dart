import 'package:animise_application/theme/theme.dart';
// ignore: unused_import
import 'package:animise_application/widgets/customer/cart/container_shopping_cart.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            ContainerShoppingCart(
                imageProduct: "assets/PVC Figure 1-7 Blaze - Arknights.png",
                imagePreorder_Ready: "assets/Ready Stock.png",
                nameProduct: "PVC Figure 1/7 Blaze - Arknights",
                price: "IDR 2,850,000"),
            ContainerShoppingCart(
                imageProduct: "assets/PVC Figure 1-7 Ifrit - Arknights.png",
                imagePreorder_Ready: "assets/Pre-Order.png",
                nameProduct: "PVC Figure 1/7 Ifrit - Arknights",
                price: "IDR 3,200,000"),
            
                
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Text("Total Price \n IDR 6,050,000",
            style: GoogleFonts.montserrat(
              color: primaryOrangeColor,
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),
          ),
          label: ""
          ),
           BottomNavigationBarItem(icon: Container(
            width: 153,
            height: 47,
             child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryOrangeColor
              ),
                onPressed: (){
                  Navigator.pushNamed(context, '/payment-page');
                }, 
                child: Text(
                  "Checkout",
                  style: GoogleFonts.montserrat(
                    color: textWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                )),
           ),
              label: "",

          
          ),
      ],),
    );
  }
}
