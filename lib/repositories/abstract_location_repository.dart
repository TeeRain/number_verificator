import 'package:number_verificator/models/user_data.dart';

abstract class ILocationRepository {
  Future<UserData> getUserData();
  Future<String> getNumberCode(countryName);
}
