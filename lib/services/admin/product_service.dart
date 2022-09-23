import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/state_notifier.dart';
import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/dialog/alert.dart';

class ProductService with ChangeNotifier {

  BuildContext context;

  ProductService(this.context);

  Future retrieveAllProduct() async {

    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['admin']['products']['index']), new List<PathParameter>.empty());

    return api.futureGet(generator.getFullEndpointUrl());
  }

  void deleteProduct(int id) {

    var api = new Api();
    var generator = new RouteGenerator();

    List<PathParameter> parameters = List.empty(growable: true);
    parameters.add(new PathParameter('id', id.toString()));

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['admin']['products']['destroy']), parameters);

    api.delete(generator.getFullEndpointUrl());

    api.onSuccess(onSuccess: (response) {
      Provider.of<Notifier>(context, listen: false).notify();
    });

    api.onFailed(onFailed: (DioError error) {
      print(error);
    });


  }

  void addProduct(FormData formData) {

    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['admin']['products']['store']), new List<PathParameter>.empty());

    api.post(generator.getFullEndpointUrl(), data: formData);

    api.onSuccess(onSuccess: (response) {
      if (response.statusCode == HttpStatus.noContent) {
        fireAlert(context, Text('Berhasil menambah product'), title: 'Success!').then((value) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            SystemNavigator.pop();
          }
        });
      }
    });

    api.onFailed(onFailed: (DioError error) {

      dynamic decode = json.decode(error.response.toString());

      int? statusCode = error.response?.statusCode;

      var text   = 'Something went wrong';
      var errors = decode['errors'];

      if (statusCode == HttpStatus.unprocessableEntity) {

        if (errors['category_id'] != null) {
          text = errors['category_id'][0];
        } else if (errors['image'] != null) {
          text = errors['image'][0];
        } else if (errors['name'] != null) {
          text = errors['name'][0];
        } else if (errors['description'] != null) {
          text = errors['description'][0];
        } else if (errors['price'] != null) {
          text = errors['price'][0];
        } else if (errors['stock'] != null) {
          text = errors['stock'][0];
        } else if (errors['release_date'] != null) {
          text = errors['release_date'][0];
        } else if (errors['estimated_date'] != null) {
          text = errors['estimated_date'][0];
        } else if (errors['pre_order'] != null) {
          text = errors['pre_order'][0];
        }

      } else if (statusCode == HttpStatus.notFound) {
        text = errors['user'][0];
      }

      fireAlert(context, Text(text), title: 'Validation error');
    });
  }
}