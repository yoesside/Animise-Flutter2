import 'package:flutter/cupertino.dart';

import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';

class OrderService {

  BuildContext context;

  OrderService(this.context);

  Future retrieve() async {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['orders']['index']), new List<PathParameter>.empty());

    return api.futureGet(generator.getFullEndpointUrl());
  }

}