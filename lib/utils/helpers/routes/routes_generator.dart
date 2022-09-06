import 'package:animise_application/utils/helpers/routes/path_parameter.dart';

class RouteGenerator {

  String version  = 'v1';
  String endpoint = '';

  RouteGenerator noVersion () {
    this.version = '';

    return this;
  }

  RouteGenerator setVersion(String version) {
    this.version = version;

    return this;
  }

  RouteGenerator setEndpoint(String endpoint, List<PathParameter> pathParameters) {

    this.endpoint = endpoint;

    pathParameters.forEach((element) {
      this.endpoint = this.endpoint.replaceAll(element.key, element.value);
    });

    return this;
  }

  String getFullEndpointUrl() {
    return version + endpoint;
  }
}