import 'package:animise_application/theme/theme.dart';
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
                    width: 175,
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
                  value: 0,
                  groupValue: selectedValue,
                  title: Text("PVC Figure"),
                  onChanged: (value) => setState(() => selectedValue = 0),
                  activeColor: primaryOrangeColor,
                ),
              ),
              RadioListTile(
                value: 1,
                groupValue: selectedValue,
                title: Text("Nendoroid"),
                onChanged: (value) => setState(() => selectedValue = 1),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 2,
                groupValue: selectedValue,
                title: Text("Figma"),
                onChanged: (value) => setState(() => selectedValue = 2),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 3,
                groupValue: selectedValue,
                title: Text("Model Kits"),
                onChanged: (value) => setState(() => selectedValue = 3),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 4,
                groupValue: selectedValue,
                title: Text("CDs"),
                onChanged: (value) => setState(() => selectedValue = 4),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 5,
                groupValue: selectedValue,
                title: Text("Manga"),
                onChanged: (value) => setState(() => selectedValue = 5),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 6,
                groupValue: selectedValue,
                title: Text("Light Novel"),
                onChanged: (value) => setState(() => selectedValue = 6),
                activeColor: primaryOrangeColor,
              ),
              RadioListTile(
                value: 7,
                groupValue: selectedValue,
                title: Text("Merchandise"),
                onChanged: (value) => setState(() => selectedValue = 7),
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
                    "Active Pre-order",
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
                    width: 186,
                  ),
                  Switch(
                    value: activePreOrderSwitch,
                    onChanged: (value) {
                      setState(() {
                        activePreOrderSwitch = value;
                        print(activePreOrderSwitch);
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
                    width: 240,
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
                    onPressed: () {},
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
    print(selectImage!.path);
    setState(() {
      image = selectImage;
    });
  }
}
