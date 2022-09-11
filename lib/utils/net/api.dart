import 'package:animise_application/utils/storage/storage.dart';
import 'package:dio/dio.dart';

class Api {

  late Response<dynamic> response;
  late Function successCallback, failedCallback;

  Future<Api> get(endpoint, {data, options, contentType = 'application/json'}) async {
    Dio dio = new Dio();

    Storage.getToken().then((token) async {
      try {

        if (token != null) {
          await dio.get(endpoint, options: Options(
              headers: {
                'Accept': 'application/json',
                'Content-Type': contentType,
                'Authorization': 'Bearer ' + token,
              }
          )).then((response) {
            successCallback(response);
          });
        } else {
          await dio.get(endpoint, options: Options(
              headers: {
                'Accept': 'application/json',
                'Content-Type': contentType,
              }
          )).then((response) {
            successCallback(response);
          });
        }

        successCallback(response);
      } on DioError catch (e) {
        if (failedCallback != null) {
          failedCallback(e);
        }
      }
    });

    return this;
  }

  Future<Api> post(endpoint, {data, options, contentType = 'application/json'}) async {
    Dio dio = new Dio();

    await Storage.getToken().then((token) async {

      try {

        dynamic headers = {
          'Accept': 'application/json',
          'Content-Type': contentType,
        };

        if (token != null) {
          headers['Authorization'] = 'Bearer ' + token;
        }

        await dio.post(endpoint, data: data, options: Options(
            headers: headers
        )).then((response) {
          successCallback(response);
        });

      } on DioError catch(e) {
        if (failedCallback != null) {
          failedCallback(e);
        }
      }

    });

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