import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/dialog/alert.dart';

class CartService {
  BuildContext context;

  CartService(this.context);

  void store(data) {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['carts']['store']), new List<PathParameter>.empty());

    api.post(generator.getFullEndpointUrl(), data: data);

    api.onSuccess(onSuccess: (response) {
      if (response.statusCode == HttpStatus.noContent) {
        fireAlert(context, Text('Berhasil memasukkan ke keranjang'), title: 'Success!');
      }
    });

    api.onFailed(onFailed: (DioError error) {

      dynamic decode = json.decode(error.response.toString());

      int? statusCode = error.response?.statusCode;

      var text   = 'Something went wrong';
      var errors = decode['errors'];

      if (statusCode == HttpStatus.unprocessableEntity) {

        if (errors['product_id'] != null) {
          text = errors['product_id'][0];
        }

        if (errors['quantity'] != null) {
          text = errors['quantity'][0];
        }

      } else if (statusCode == HttpStatus.notFound) {
        text = errors['user'][0];
      }

      fireAlert(context, Text(text), title: 'Validation error');
    });
  }
}