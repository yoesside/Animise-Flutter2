
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/dialog/alert.dart';

class ProfileService {
  BuildContext context;

  ProfileService(this.context);

  Future retrieve() async {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['profile']['index']), new List<PathParameter>.empty());

    return api.futureGet(generator.getFullEndpointUrl());
  }

  void update(FormData formData) {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['profile']['store']), new List<PathParameter>.empty());

    api.post(generator.getFullEndpointUrl(), data: formData);

    api.onSuccess(onSuccess: (response) {
      if (response.statusCode == HttpStatus.noContent) {
        fireAlert(context, Text('Berhasil mengubah data'), title: 'Success!').then((value) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            SystemNavigator.pop();
          }
        });
      }
    });
  }
}