import 'dart:convert';

import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/utils/routes/routes.dart';
import 'package:animise_application/widgets/customer/home/container_product_home_mini.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

import '../../../services/customer/banner_service.dart';

class HomeCustomerPage extends StatefulWidget {
  @override
  _HomeCustomerPageState createState() => _HomeCustomerPageState();
}

class _HomeCustomerPageState extends State<HomeCustomerPage> {
  @override
  Widget build(BuildContext context) {
    BannerService bannerService = new BannerService(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryOrangeColor,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 0,
            top: 5,
            bottom: 5,
            right: 0,
          ),
          child: Row(
            children: [
              Flexible(
                  child: Container(
                width: 360,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 11,
                        bottom: 11,
                      ),
                      fillColor: Color(0xffFFFFFF),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Search",
                      hintStyle: GoogleFonts.montserrat(
                        color: primaryOrangeColor,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: primaryOrangeColor,
                      )),
                ),
              )),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/shopping-cart');
                },
                child: Icon(Icons.shopping_cart))
            ],
          ),
        ),
      ),
      backgroundColor: bodyBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          left: 23,
          // right: 20,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FutureBuilder(
                    future: bannerService.retrieve(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                      if (snapshot.connectionState == ConnectionState.done) {

                        var banners = json.decode(snapshot.data.toString());

                        List<Widget> widgets = List<Widget>.empty(growable: true);

                        banners['data'].forEach((banner) {
                          widgets.add(
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  banner['image'],
                                  width: 360,
                                  height: 150,
                                ),
                              ),
                            )
                          );

                          widgets.add(
                            SizedBox(
                              width: 10,
                            )
                          );
                        });

                        return Row(
                          children: widgets,
                        );
                      }

                      return Text('wait a minute');
                    },
                  ),
                ),
                Text(
                  "Categories",
                  style: GoogleFonts.montserrat(
                      color: textBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    // left: 20,
                    right: 31,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page');
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/pvc_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "PVC Figure",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page');
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/nendoroid_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Nendoroid",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page');
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/figma_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Figma",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page');
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/gundam_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Model Kit",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    // left: 20,
                    right: 31,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page');
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/cd_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "CDs",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page');
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/manga_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Manga",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page');
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/lightnovel_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Light Novel",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page');
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/merchandise_icon.png",
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                "Merchandise",
                                style: GoogleFonts.montserrat(
                                    color: textBlack,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Most liked",
                  style: GoogleFonts.montserrat(
                      color: textBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 31),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductList(
                        imageProduct:
                            "assets/PVC Figure 1-7 Ch'en Arknights.png",
                        imagePreorder_Ready: "assets/Ready Stock.png",
                        nameProduct: "PVC Figure 1/7 Ch'en Arknights",
                        price: "IDR 2,300,000",
                      ),
                      ProductList(
                        imageProduct:
                            "assets/PVC Figure 1-7 Sorasaki Hina - Blue Archive.png",
                        imagePreorder_Ready: "assets/Pre-Order.png",
                        nameProduct:
                            "PVC Figure 1/7 Sorasaki Hina - Blue Archive",
                        price: "IDR 4,100,000",
                      ),
                      ProductList(
                        imageProduct:
                            "assets/Nendoroid Gawr Gura - Hololive Production.png",
                        imagePreorder_Ready: "assets/Ready Stock.png",
                        nameProduct:
                            "Nendoroid Gawr Gura - Hololive Production",
                        price: "IDR 860,000",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
