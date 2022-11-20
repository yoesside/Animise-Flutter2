// import 'dart:js';

import 'package:animise_application/providers/state_notifier.dart';
import 'package:animise_application/screens/admin/product/add_product_page.dart';
// ignore: unused_import
import 'package:animise_application/screens/admin/banner/modify_banner_page.dart';
import 'package:animise_application/screens/customer/product/search/detail/detail_product_page.dart';
import 'package:animise_application/screens/customer/product/view_product_page.dart';
// ignore: unused_import

import 'package:animise_application/screens/customer/profile/edit_address_page.dart';
import 'package:animise_application/screens/customer/profile/edit_name_phonenum_page.dart';
import 'package:animise_application/screens/customer/profile/edit_password_page.dart';
// ignore: unused_import
import 'package:animise_application/screens/customer/home/home_customer_page.dart';
import 'package:animise_application/screens/admin/home/homescreen_admin_page.dart';
// ignore: unused_import
import 'package:animise_application/screens/admin/order/order_list_page.dart';
// ignore: unused_import
import 'package:animise_application/screens/customer/product/search/search_customer_page.dart';
import 'package:animise_application/screens/customer/cart/shopping_cart_page.dart';
import 'package:animise_application/screens/customer/profile/wishlist/wishlist_customer_page.dart';
// ignore: unused_import
import 'package:animise_application/screens/customer/payment/payment_page.dart';
// ignore: unused_import
import 'package:animise_application/screens/customer/cart/shopping_cart_page_null.dart';
import 'package:animise_application/screens/auths/sign_in_page.dart';
import 'package:animise_application/screens/auths/sign_up_page.dart';
// ignore: unused_import
import 'package:animise_application/screens/splash/splash_page.dart';
import 'package:animise_application/widgets/customer/home/homescreen_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Notifier>(
      create: (context) => Notifier(),
      child: MaterialApp(
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
          '/detail-page': (conter) => DetailProductPage(),
        },
      ),
    );
  }
}


