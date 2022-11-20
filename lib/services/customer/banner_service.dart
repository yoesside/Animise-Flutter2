import 'package:animise_application/utils/helpers/routes/path_parameter.dart';
import 'package:animise_application/utils/net/api.dart';
import 'package:animise_application/utils/routes/routes.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/helpers/routes/routes_generator.dart';

class BannerService {
  BuildContext context;

  BannerService(this.context);

  Future retrieve() async {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['user']['banners']['index']), new List<PathParameter>.empty());

    return api.futureGet(generator.getFullEndpointUrl());
  }
}