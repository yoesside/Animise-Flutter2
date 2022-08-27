// import 'dart:js';

import 'package:animise_application/pages/add%20product/add_product_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/chat/chat_customer_page.dart';
import 'package:animise_application/pages/modify%20banner%20-%20add_delete/modify_banner_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/search%20product/detail%20product/detail_product_page.dart';
// ignore: unused_import

import 'package:animise_application/pages/edit%20profile/edit_address_page.dart';
import 'package:animise_application/pages/edit%20profile/edit_name_phonenum_page.dart';
import 'package:animise_application/pages/edit%20profile/edit_password_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/home%20customer/home_customer_page.dart';
import 'package:animise_application/pages/home%20admin/homescreen_admin_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/modify%20banner/modify_banner_page.dart';
import 'package:animise_application/pages/order%20list/order_list_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/search%20product/search_customer_page.dart';
import 'package:animise_application/pages/view%20shopping%20cart/shopping_cart_page.dart';
import 'package:animise_application/pages/view%20product/view_product_page.dart';
import 'package:animise_application/pages/edit%20profile/view%20wishlist/wishlist_customer_page.dart';
import 'package:animise_application/widgets/home%20customer/homescreen_navbar.dart';
// ignore: unused_import
import 'package:animise_application/pages/payment/payment_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/view%20shopping%20cart/shopping_cart_page_null.dart';
import 'package:animise_application/pages/auths/sign_in_page.dart';
import 'package:animise_application/pages/auths/sign_up_page.dart';
// ignore: unused_import
import 'package:animise_application/pages/splash/splash_page.dart';
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
        '/': (context) => SplashPage(),
        //Klo mau ganti route ke DetailPage, tulis "DetailPage()"
        //Klo mau ganti route ke ViewProductPage, tulis "ViewProductPage()"
        //biar gak perlu lagi nge cek tiap halaman buka dari halam splash page 
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


