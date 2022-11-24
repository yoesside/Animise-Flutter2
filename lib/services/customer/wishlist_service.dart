import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';

class WishlistService {
  BuildContext context;

  WishlistService(this.context);

  Future retrieve() async {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['wishlists']['index']), new List<PathParameter>.empty());

    return api.futureGet(generator.getFullEndpointUrl());
  }

  Future store(FormData formData) async {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['wishlists']['store']), new List<PathParameter>.empty());

    return api.post(generator.getFullEndpointUrl(), data: formData);
  }

  Future show(id) async {
    var api = new Api();
    var generator = new RouteGenerator();

    List<PathParameter> lists = new List<PathParameter>.empty(growable: true);
    lists.add(new PathParameter(':id', id));

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['wishlists']['show']), lists);

    return api.futureGet(generator.getFullEndpointUrl());
  }

}