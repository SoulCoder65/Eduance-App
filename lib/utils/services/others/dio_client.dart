import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 10000;
  static BaseOptions options = new BaseOptions(
    baseUrl: dotenv.env['API_URL']!,
    connectTimeout: connectionTimeout,
    receiveTimeout: receiveTimeout,
  );
  Dio _dio = Dio(options);

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
   try{
     final Response response = await _dio.post(
       uri,
       data: data,
       queryParameters: queryParameters,
       options: options,
       cancelToken: cancelToken,
       onSendProgress: onSendProgress,
       onReceiveProgress: onReceiveProgress,
     );
     return response;

   }catch(e)
    {
      throw e;

    }
    }
}
