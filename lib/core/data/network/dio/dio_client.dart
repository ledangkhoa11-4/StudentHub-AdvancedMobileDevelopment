import 'package:dio/dio.dart';

import 'configs/dio_configs.dart';

class DioClient {
  final DioConfigs dioConfigs;
  final Dio _dio;
  final Dio _dioMultipart;

  DioClient({required this.dioConfigs})
      : _dio = Dio()
          ..options.baseUrl = dioConfigs.baseUrl
          ..options.contentType = Headers.jsonContentType
          ..options.connectTimeout =
              Duration(milliseconds: dioConfigs.connectionTimeout)
          ..options.receiveTimeout =
              Duration(milliseconds: dioConfigs.receiveTimeout),
        _dioMultipart = Dio()
          ..options.baseUrl = dioConfigs.baseUrl
          ..options.contentType = Headers.multipartFormDataContentType
          ..options.connectTimeout =
              Duration(milliseconds: dioConfigs.connectionTimeout)
          ..options.receiveTimeout =
              Duration(milliseconds: dioConfigs.receiveTimeout);

  Dio get dio => _dio;

  Dio get dioMultipart => _dioMultipart;


  Dio addInterceptors(Iterable<Interceptor> interceptors) {
    _dioMultipart..interceptors.addAll(interceptors);
    return _dio..interceptors.addAll(interceptors);
  }
}
