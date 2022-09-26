import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/state_notifier.dart';
import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/dialog/alert.dart';

class BannerService {

  BuildContext context;

  BannerService(this.context);

  Future retrieveAllBanner() async {

    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['admin']['banners']['index']), new List<PathParameter>.empty());

    return api.futureGet(generator.getFullEndpointUrl());
  }

  void deleteBanner(int id) {

    var api = new Api();
    var generator = new RouteGenerator();

    List<PathParameter> parameters = List.empty(growable: true);
    parameters.add(new PathParameter('id', id.toString()));

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['admin']['banners']['destroy']), parameters);

    api.delete(generator.getFullEndpointUrl());

    api.onSuccess(onSuccess: (response) {
      Provider.of<Notifier>(context, listen: false).notify();
    });

    api.onFailed(onFailed: (DioError error) {
      print(error);
    });
  }

  void addBanner(FormData formData) {

    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['admin']['banners']['store']), new List<PathParameter>.empty());

    api.post(generator.getFullEndpointUrl(), data: formData);

    api.onSuccess(onSuccess: (response) {
      if (response.statusCode == HttpStatus.noContent) {
        fireAlert(context, Text('Berhasil menambah banner'), title: 'Success!');

        Provider.of<Notifier>(context, listen: false).notify();
      }
    });

    api.onFailed(onFailed: (DioError error) {

      dynamic decode = json.decode(error.response.toString());

      int? statusCode = error.response?.statusCode;

      var text   = 'Something went wrong';
      var errors = decode['errors'];

      if (statusCode == HttpStatus.unprocessableEntity) {

        if (errors['image'] != null) {
          text = errors['image'][0];
        }

      } else if (statusCode == HttpStatus.notFound) {
        text = errors['user'][0];
      }

      fireAlert(context, Text(text), title: 'Validation error');
    });
  }
}