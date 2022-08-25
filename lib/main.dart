// import 'dart:js';

import 'package:animise_application/pages/add_product_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/chat_customer_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/detail_product_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/detail_product_page2_testdoang.dart';
import 'package:animise_application/pages/edit_address_page.dart';
import 'package:animise_application/pages/edit_name_phonenum_page.dart';
import 'package:animise_application/pages/edit_password_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/home_customer_page.dart';
import 'package:animise_application/pages/homescreen_admin_page.dart';
import 'package:animise_application/pages/modify_banner_page.dart';
import 'package:animise_application/pages/order_list_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/search_customer_page.dart';
import 'package:animise_application/pages/shopping_cart_page.dart';
import 'package:animise_application/pages/view_product_page.dart';
import 'package:animise_application/pages/wishlist_customer_page.dart';
import 'package:animise_application/widgets/homescreen_navbar.dart';
// ignore: unused_import
import 'package:animise_application/pages/payment_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/shopping_cart_page_null.dart';
import 'package:animise_application/pages/sign_in_page.dart';
import 'package:animise_application/pages/sign_up_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/splash_page.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => ChatCustomerPage(),
        //Klo mau ganti route ke DetailPage, tulis "DetailPage()"
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/homescreen-admin': (context) => HomescreenAdminPage(),
        '/add-product': (context) => AddProductPage(),
        '/main-customer': (conter) => MainCustomerPage(),
        '/edit-name-phone': (conter) => EditNamePhoneNum(),
        '/edit-password': (conter) => EditPasswordPage(),
        '/edit-address': (conter) => EditAddressPage(),
        '/view-product': (conter) => ViewProductPage(),
        '/modify-banner': (conter) => ModifyBannerPage(),
        '/order-list': (conter) => OrderListPage(),
        '/payment-page': (conter) => PaymentPage(),
        '/shopping-cart': (conter) => ShoppingCartPage(),
        '/shopping-cartnull': (conter) => ShoppingCartNull(),
        '/search-page': (conter) => SearchCustomerPage(),
        '/wishlist-page': (conter) => WishlistPage(),
      },
    );
  }
}


