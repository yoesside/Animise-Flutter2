import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/dialog/alert.dart';

class CartService {
  BuildContext context;

  CartService(this.context);

  Future retrieve() {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['carts']['index']), new List<PathParameter>.empty());

    return api.futureGet(generator.getFullEndpointUrl());
  }

  Future delete(id) async {
    var api = new Api();
    var generator = new RouteGenerator();

    List<PathParameter> lists = new List<PathParameter>.empty(growable: true);
    lists.add(new PathParameter('id', id));

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['carts']['destroy']), lists);

    api.onSuccess(onSuccess: (response) {
      print(response);
    });

    api.onFailed(onFailed: (DioError error) {
      print(generator.getFullEndpointUrl());
    });

    return api.delete(generator.getFullEndpointUrl());
  }

  void store(id, {quantity = 1, withAlert = true, message = 'Berhasil memasukkan ke keranjang', onSuccess}) {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['carts']['store']), new List<PathParameter>.empty());

    api.post(generator.getFullEndpointUrl(), data: {
      'product_id': id,
      'quantity': quantity,
    });

    api.onSuccess(onSuccess: (response) {
      if (response.statusCode == HttpStatus.noContent) {

        if (withAlert) {
          fireAlert(context, Text(message), title: 'Success!');
        }

        if (onSuccess != null) {
          onSuccess();
        }

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