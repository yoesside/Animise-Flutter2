import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../providers/state_notifier.dart';
import '../../utils/helpers/routes/path_parameter.dart';
import '../../utils/helpers/routes/routes_generator.dart';
import '../../utils/net/api.dart';
import '../../utils/routes/routes.dart';

class OrderService {

  BuildContext context;

  OrderService(this.context);

  Future retrieveAllOrders({String status = 'pending'}) {
    var api = new Api();
    var generator = new RouteGenerator();

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['admin']['orders']['index']), new List<PathParameter>.empty());

    return api.futureGet(generator.getFullEndpointUrl() + '?status=' + status);
  }

  void updateOrder(int id, String status) {

    var api = new Api();
    var generator = new RouteGenerator();

    List<PathParameter> parameters = List.empty(growable: true);
    parameters.add(new PathParameter('id', id.toString()));

    generator.noVersion();
    generator.setEndpoint(generateUrlFromBaseUrl(routeConfig['endpoints']['admin']['orders']['update']), parameters);

    api.put(generator.getFullEndpointUrl(), data: {
      'status': status
    });

    api.onSuccess(onSuccess: (response) {
      Provider.of<Notifier>(context, listen: false).notify();
    });

    api.onFailed(onFailed: (DioError error) {
      print(error);
    });
  }

}