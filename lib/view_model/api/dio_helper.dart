import 'package:dio/dio.dart';
import 'end_point.dart';

class DioHelper {
  static late final Dio dio;

  static initialize() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response?> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.options.headers = {};
    try {
      var response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      (e.toString());
      rethrow;
    }
  }
}
