import 'dart:convert';

import 'package:animise_application/services/admin/product_service.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  int selectedValue = 0;
  bool activePreOrderSwitch = false;
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  TextEditingController name             = TextEditingController();
  TextEditingController price            = TextEditingController();
  TextEditingController release          = TextEditingController();
  TextEditingController estimatedArrival = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryOrangeColor,
        title: Text("Add Product"),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Product Photo",
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    " *",
                    style: fifthTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    width: 145,
                  ),
                  TextButton(
                      onPressed: () {
                        filePicker();
                      },
                      child: Text(
                        "Add Photo",
                        style: thirdTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 13,
                        ),
                      )
                    ),
                  SizedBox(
                    height: 14,
                  ),
                  //Kendala masih bingung cara upload foto produk + masih nyari cara
                ],
              ),
              image == null
                ? Text("")
                : Image.file(
                    File(image!.path),
                    width: 120,
                    fit: BoxFit.cover,
                  ),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                Text(
                  "Product name",
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  " *",
                  style: fifthTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
              ]),
              TextField(
                autofocus: true,
                controller: name,
                decoration: InputDecoration(
                  hintText: "Enter your name product",
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(children: [
                Text(
                  "Category",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  " *",
                  style: fifthTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
              ]),
              Transform.scale(
                scale: 1,
                child: RadioListTile(
                  value: 1,
                  groupValue: selectedValue,
                  title: Text("PVC Figure"),
                  onChanged: (value) => setState(() => selectedValue = 1),
                  activeColor: primaryOrangeColor,
                ),
              ),
              RadioListTile(
                value: 2,
                groupValue: selectedValue,
                title: Text("Nendoroid"),
                onChanged: (value) => setState(() => selectedValue = 2),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 3,
                groupValue: selectedValue,
                title: Text("Figma"),
                onChanged: (value) => setState(() => selectedValue = 3),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 4,
                groupValue: selectedValue,
                title: Text("Model Kits"),
                onChanged: (value) => setState(() => selectedValue = 4),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 5,
                groupValue: selectedValue,
                title: Text("CDs"),
                onChanged: (value) => setState(() => selectedValue = 5),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 6,
                groupValue: selectedValue,
                title: Text("Manga"),
                onChanged: (value) => setState(() => selectedValue = 6),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 7,
                groupValue: selectedValue,
                title: Text("Light Novel"),
                onChanged: (value) => setState(() => selectedValue = 7),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 8,
                groupValue: selectedValue,
                title: Text("Merchandise"),
                onChanged: (value) => setState(() => selectedValue = 8),
                activeColor: primaryOrangeColor,
              ),
              Row(
                children:[ Text(
                  "Price",
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  " *",
                  style: fifthTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
              ]),
              TextField(
                autofocus: true,
                controller: price,
                decoration: InputDecoration(
                  hintText: "Enter your price",
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Active Ready Stock",
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                  " *",
                  style: fifthTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
                  SizedBox(
                    width: 140,
                  ),
                  Switch(
                    value: activePreOrderSwitch,
                    onChanged: (value) {
                      setState(() {
                        activePreOrderSwitch = value;
                      });
                    },
                    activeTrackColor: primaryOrangeColor,
                    activeColor: primaryOrangeColor,
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "Release",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
              TextField(
                controller: release,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter release product date",
                ),
              ),
              // Kalau barangnya gak pre-order, gak perlu diisi
              SizedBox(
                height: 22,
              ),
              Text(
                "Estimated Arrival",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
              TextField(
                controller: estimatedArrival,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter estimated arrival date",
                ),
              ),
              // Kalau barangnya gak pre-order, gak perlu diisi
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                  ),
                  ElevatedButton(
                    child: Text(
                      "Add Product",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: primaryOrangeColor,
                    ),
                    onPressed: () async {

                      dynamic map = {
                        'category_id': selectedValue,
                        'name': name.text,
                        'description': 'asasdfsddf',
                        'price': price.text,
                        'stock': 10,
                        'pre_order': activePreOrderSwitch ? 1 : 0,
                        'release_date': release.text,
                        'estimated_date': estimatedArrival.text,
                      };

                      if (image != null) {
                        map['image'] = await MultipartFile.fromFile(image == null ? '' : image!.path, filename: image?.name);
                      }

                      var formData = FormData.fromMap(map);

                      var service = new ProductService(context);

                      service.addProduct(formData);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void filePicker() async {
    final XFile? selectImage =
        await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = selectImage;
    });
  }
}
