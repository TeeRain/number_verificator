import 'package:dio/dio.dart';

class ApiClient {
  const ApiClient();

  Dio _createApiClient() {
    final dio = Dio();

    return dio;
  }

  Dio get httpClient => _createApiClient();
}
