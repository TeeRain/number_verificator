import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:number_verificator/repositories/abstract_location_repository.dart';

class NumberVerificatorProvider extends ChangeNotifier {
  static const maxLength = 14;

  final ILocationRepository _repository;

  String _countryCode = '';
  String _phoneCode = '';
  String _number = '';

  bool _isFull = false;
  bool _isLoading = true;

  NumberVerificatorProvider({
    required ILocationRepository locationRepository,
  }) : _repository = locationRepository {
    _loadCountryInfo();
  }

  String get countryCode => _countryCode;
  String get phoneCode => _phoneCode;
  String get number => _number;
  bool get isFull => _isFull;
  bool get isLoading => _isLoading;

  void onCountrySelected(Country country) {
    _phoneCode = country.phoneCode;
    _countryCode = country.countryCode;
    notifyListeners();
  }

  void onTextChanged(String value) {
    _number = value;
    _isFull = value.length >= maxLength;
    notifyListeners();
  }

  Future<void> _loadCountryInfo() async {
    final userData = await _repository.getUserData();
    final phoneCode = await _repository.getNumberCode(userData.country);

    _phoneCode = phoneCode;
    _countryCode = userData.countryCode;
    _isLoading = false;
    notifyListeners();
  }
}
