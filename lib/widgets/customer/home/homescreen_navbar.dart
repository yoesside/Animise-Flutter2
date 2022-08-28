
import 'package:animise_application/screens/customer/home/home_customer_page.dart';
import 'package:animise_application/screens/customer/order/order_status_customer_page.dart';
import 'package:animise_application/screens/customer/profile/profile_customer_page.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../screens/customer/chat/chat_customer_page.dart';

class MainCustomerPage extends StatefulWidget {

  @override
  _MainCustomerPageState createState() => _MainCustomerPageState();
}

class _MainCustomerPageState extends State<MainCustomerPage> {
  int currentIndex = 0;
  final screens = [
    HomeCustomerPage(),
    ChatCustomerPage(),
    OrderStatusCustomerPage(),
    ProfileCustomerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryOrangeColor,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: primaryOrangeColor,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat),
            label: "Chat",
            backgroundColor: primaryOrangeColor,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.online_prediction_rounded),
            label: "Order Status",
            backgroundColor: primaryOrangeColor,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: primaryOrangeColor,
          ),
        ],
      ),
    );
  }
}