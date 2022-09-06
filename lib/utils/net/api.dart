import 'package:dio/dio.dart';

class Api {

  late Response<Map> response;
  late Function successCallback, failedCallback;

  Future<Api> get(endpoint, {data, options}) async {
    Dio dio = new Dio();

    try {
      response = await dio.get(endpoint, options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }
      ));

      successCallback(response);
    } on DioError catch (e) {
      if (failedCallback != null) {
        failedCallback(e);
      }
    }

    return this;
  }

  Future<Api> post(endpoint, {data, options}) async {
    Dio dio = new Dio();

    try {
      response = await dio.post(endpoint, data: data, options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }
      ));

      successCallback(response);
    } on DioError catch(e) {
      if (failedCallback != null) {
        failedCallback(e);
      }
    }

    return this;
  }

  Api onSuccess({required Function onSuccess}) {

    this.successCallback = onSuccess;

    return this;
  }

  Api onFailed({required Function onFailed}) {

    this.failedCallback = onFailed;

    return this;
  }
}