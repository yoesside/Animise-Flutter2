import 'dart:collection';

import 'package:flutter/widgets.dart';

import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';

class SearchProductService {
  BuildContext context;

  SearchProductService(this.context);

  Future retrieve({name, category}) async {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['search']['index']), new List<PathParameter>.empty());

    return api.futureGet(generator.getFullEndpointUrl(), queryParameters: {
      'name': name,
      'category': category,
    });
  }
}