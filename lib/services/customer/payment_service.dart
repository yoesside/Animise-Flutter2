import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/dialog/alert.dart';

class PaymentService {

  BuildContext context;

  PaymentService(this.context);

  void upload (FormData data) {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['carts']['payment']), new List<PathParameter>.empty());

    api.post(generator.getFullEndpointUrl(), data: data);

    api.onSuccess(onSuccess: (response) {

      if (response.statusCode == HttpStatus.noContent) {
        fireAlert(context, Text('Payment uploaded Successfully'), title: 'Success!').then((value) {
          Navigator.pushReplacementNamed(context, '/main-customer');
        });
      }
    });

    api.onFailed(onFailed: (DioError error) {

      dynamic decode = json.decode(error.response.toString());

      int? statusCode = error.response?.statusCode;

      var text   = 'Something went wrong';
      var errors = decode['errors'];

      if (statusCode == HttpStatus.unprocessableEntity) {

        if (errors['proof'] != null) {
          text = errors['proof'][0];
        }

      } else if (statusCode == HttpStatus.notFound) {
        text = errors['user'][0];
      }

      fireAlert(context, Text(text), title: 'Validation error');
    });
  }
}