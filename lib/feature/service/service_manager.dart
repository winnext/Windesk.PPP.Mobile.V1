import 'package:dio/dio.dart';

class ServiceManager {
  late final Dio dio;

  ServiceManager() {
    final BaseOptions baseOptions = BaseOptions(
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(baseOptions);
  }
}
