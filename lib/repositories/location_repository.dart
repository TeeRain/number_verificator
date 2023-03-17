import 'package:dio/dio.dart';
import 'package:number_verificator/config/api/api_client.dart';
import 'package:number_verificator/models/user_data.dart';
import 'package:number_verificator/repositories/abstract_location_repository.dart';

class LocationRepository implements ILocationRepository {
  final Dio _apiClient;

  LocationRepository({required ApiClient apiClient})
      : _apiClient = apiClient.httpClient;

  @override
  Future<UserData> getUserData() async {
    final response = await _apiClient.get('http://ip-api.com/json');

    try {
      return UserData.fromJson(response.data);
    } catch (e) {
      throw Exception('Data parsing error: $e');
    }
  }

  @override
  Future<String> getNumberCode(countryName) async {
    final response = await _apiClient
        .get('https://countrycode.dev/api/countries/$countryName');

    try {
      return response.data[0]['E164'];
    } catch (e) {
      throw Exception('Data parsing error: $e');
    }
  }
}
