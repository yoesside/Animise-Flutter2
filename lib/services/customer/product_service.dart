import 'package:flutter/widgets.dart';

import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';

class ProductService {
  BuildContext context;

  ProductService(this.context);

  Future retrieve(id) async {
    var api = new Api();
    var generator = new RouteGenerator();

    List<PathParameter> lists = new List<PathParameter>.empty(growable: true);

    lists.add(new PathParameter('id', id));

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['products']['show']), lists);

    return api.futureGet(generator.getFullEndpointUrl());
  }
}