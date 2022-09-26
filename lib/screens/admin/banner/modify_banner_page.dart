// ignore: unused_import
import 'dart:convert';

import 'package:animise_application/providers/state_notifier.dart';
import 'package:animise_application/services/admin/banner_service.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:animise_application/widgets/admin/banner/banner_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ModifyBannerPage extends StatefulWidget {
  @override
  _ModifyBannerPage createState() => _ModifyBannerPage();
}

class _ModifyBannerPage extends State<ModifyBannerPage> {
  XFile? image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    BannerService service = new BannerService(context);

    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        title: Text("Modify Banner"),
        backgroundColor: primaryOrangeColor,
      ),
      body: Consumer<Notifier>(
        builder: (context, provider, child) {
          return FutureBuilder(
            future: service.retrieveAllBanner(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

              if (snapshot.connectionState == ConnectionState.done) {
                var banners = json.decode(snapshot.data.toString());

                List<Widget> widgets = List<Widget>.empty(growable: true);

                banners['data'].forEach((banner) {
                  widgets.add(
                      BannerList(
                        imageBanner: banner['image'],
                        id: banner['id'],
                      )
                  );
                });

                widgets.add(SizedBox(
                  height: 15,
                ));

                widgets.add(Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: (){
                      filePicker();
                    },
                    backgroundColor: primaryOrangeColor,
                  )],
                ));

                return Column(
                  children: widgets,
                );
              }

              return Text('wait a minute');
            },
          );
        },
      ),
    );
  }

  void filePicker() async {
    final XFile? selectImage = await _picker.pickImage(source: ImageSource.gallery);

    image = selectImage;

    dynamic map = {
      'image': await MultipartFile.fromFile(image == null ? '' : image!.path, filename: image?.name),
    };

    var formData = FormData.fromMap(map);

    var service = new BannerService(context);

    service.addBanner(formData);
  }
}